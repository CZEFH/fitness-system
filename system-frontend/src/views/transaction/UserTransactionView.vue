<template>
  <div id="customersView">
    <a-table
      :ref="tableRef"
      :columns="columns"
      :data="dataList"
      :pagination="{
        showTotal: true,
        pageSize: searchParams.pageSize,
        current: searchParams.current,
        total,
      }"
      @page-change="onPageChange"
    >
      <template #tags="{ record }">
        <a-space wrap>
          <a-tag v-for="(tag, index) of record.tags" :key="index" color="green"
            >{{ tag }}
          </a-tag>
        </a-space>
      </template>
      <template #acceptedRate="{ record }">
        {{
          `${
            record.submitNum ? record.acceptedNum / record.submitNum : "0"
          }% (${record.acceptedNum}/${record.submitNum})`
        }}
      </template>
      <template #createTime="{ record }">
        {{ moment(record.createTime).format("YYYY-MM-DD") }}
      </template>
    </a-table>
  </div>
</template>

<script setup lang="ts">
import { onMounted, ref, watchEffect } from "vue";
import {
  Page_Question_,
  Transaction,
  TransactionControllerService,
  TransactionQueryRequest,
} from "../../../generated";
import message from "@arco-design/web-vue/es/message";
import { useRouter } from "vue-router";
import moment from "moment";
import {IconPlus} from "@arco-design/web-vue/es/icon";

const tableRef = ref();

const dataList = ref([]);
const total = ref(0);

const searchParams = ref<TransactionQueryRequest>({
  userId: undefined,
  amount: undefined,
  current: 1,
  pageSize: 12,
});

const loadData = async () => {
  try {
    const res = await TransactionControllerService.listMyTransactionVoByPageUsingPost(searchParams.value);
    if (res.code === 0) {
      dataList.value = res.data.records;
      total.value = res.data.total;
    } else {
      message.error("查询失败，" + res.message);
    }
  } catch (error) {
    message.error("查询过程中发生错误");
    console.error(error);
  }
};

/**
 * 监听 searchParams 变量，改变时触发页面的重新加载
 */
watchEffect(() => {
  loadData();
});

/**
 * 页面加载时，请求数据
 */
onMounted(() => {
  loadData();
});

const columns = [
  {
    title: "消费ID",
    dataIndex: "id",
    width: 30,
  },
  {
    title: "客户ID",
    dataIndex: "userId",
    width: 70,
  },
  {
    title: "消费金额",
    dataIndex: "amount",
    width: 40,
  },
  {
    title: "消费描述",
    dataIndex: "description",
    ellipsis: true,
    tooltip: true,
    width: 260,
  },
  {
    title: "消费时间",
    slotName: "createTime",
    width: 50,
  },
];

const onPageChange = (page: number) => {
  searchParams.value = {
    ...searchParams.value,
    current: page,
  };
};

</script>

<style scoped>
#customersView {
  max-width: 1280px;
  margin: 0 auto;
}
</style>
