<template>
  <div class="statistics-container">
    <!-- 将两个统计项放入 flex 容器中 -->
    <div class="statistics-row">
      <a-statistic
          title="总消费额"
          :value="totalAmount"
          :precision="2"
          :value-from="0"
          :start="start"
          animation
          class="statistic-item"
      >
        <template #prefix>
          <icon-arrow-rise />
        </template>
        <template #suffix> 元</template>
      </a-statistic>

      <a-statistic
          title="今日消费额"
          :value="todayAmount"
          :precision="2"
          :value-from="0"
          :start="start"
          animation
          class="statistic-item"
      >
        <template #prefix>
          <icon-arrow-rise />
        </template>
        <template #suffix>&nbsp;元</template>
      </a-statistic>
    </div>

    <div id="chart" style="width: 100%; height: 400px;"></div>
  </div>
</template>



<script setup lang="ts">
import { ref, onMounted, nextTick } from 'vue';
import * as echarts from 'echarts';
import { TransactionControllerService } from "../../../generated";

const totalAmount = ref(0); // 总消费额
const todayAmount = ref(0); // 今日消费额
const start = ref(false);
const dailyAmounts = ref<{ date: string; amount: number }[]>([]); // 每日消费记录

const renderChart = () => {
  const chartDom = document.getElementById('chart');
  if (!chartDom) return;

  const myChart = echarts.init(chartDom);

  const option = {
    title: {
      text: '历史每日消费额统计',
      left: 'center',
    },
    tooltip: {
      trigger: 'axis',
    },
    xAxis: {
      type: 'category',
      data: dailyAmounts.value.map(item => item.date),
    },
    yAxis: {
      type: 'value',
    },
    series: [
      {
        data: dailyAmounts.value.map(item => item.amount),
        type: 'line',
        smooth: true,
      },
    ],
  };

  myChart.setOption(option);
};

onMounted(async () => {
  start.value = true;

  const now = new Date();
  const startOfToday = new Date(now.getFullYear(), now.getMonth(), now.getDate());
  const endOfToday = new Date(startOfToday.getTime() + 24 * 60 * 60 * 1000 - 1);

  const gmt8Start = startOfToday.toLocaleString('sv-SE', { timeZone: 'Asia/Shanghai' }).replace(' ', 'T') + '.000Z';
  const gmt8End = endOfToday.toLocaleString('sv-SE', { timeZone: 'Asia/Shanghai' }).replace(' ', 'T') + '.999Z';

  const response = await TransactionControllerService.listTransactionByPageUsingPost({
    pageSize: 10000,
  });

  if (response?.data?.records) {
    const records = response.data.records;

    totalAmount.value = records.reduce(
        (sum: number, record: { amount?: number }) => sum + (record.amount || 0),
        0
    );

    todayAmount.value = records
        .filter((record: { createTime?: string }) => {
          const createTime = new Date(record.createTime || '').toISOString();
          return createTime >= gmt8Start && createTime <= gmt8End;
        })
        .reduce((sum: number, record: { amount?: number }) => sum + (record.amount || 0), 0);

    // 处理每日消费数据
    const dailyMap: Record<string, number> = {};

    records.forEach((record: { createTime?: string; amount?: number }) => {
      const date = new Date(record.createTime || '')
          .toLocaleDateString('zh-CN', { timeZone: 'Asia/Shanghai' });
      dailyMap[date] = (dailyMap[date] || 0) + (record.amount || 0);
    });

    dailyAmounts.value = Object.entries(dailyMap)
        .map(([date, amount]) => ({ date, amount }))
        .sort((a, b) => new Date(a.date).getTime() - new Date(b.date).getTime());
  }

  await nextTick();
  renderChart();
});
</script>


<style scoped>
.statistics-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 80px;
}

.statistics-row {
  display: flex;
  justify-content: space-between;
  width: 100%;
  max-width: 800px;
  gap: 20px;
}

.statistic-item {
  flex: 1;
  text-align: center;
}

#chart {
  width: 100%;
  max-width: 1000px;
  height: 700px;
}
</style>

