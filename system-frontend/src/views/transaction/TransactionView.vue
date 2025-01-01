<template>
  <div id="customersView">
    <a-form :model="searchParams" layout="inline">
      <a-form-item field="userId" label="客户ID" style="min-width: 280px">
        <a-input v-model="searchParams.userId" placeholder="请输入" />
      </a-form-item>
      <a-form-item>
        <a-button type="primary" @click="doSubmit">提交</a-button>
      </a-form-item>
      <div style="display: flex; justify-content: flex-end; min-width:860px">
        <a-button type="primary" style="min-width: 100px" @click="toTransactionPage">
          <IconPlus />&nbsp; 新建
        </a-button>
      </div>
    </a-form>
    <a-divider size="0" />
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
      <template #optional="{ record }">
        <a-space>
          <a-button type="primary" @click="toTransactionUpdatePage(record)">
            修改
          </a-button>
          <a-button type="outline" @click="deleteTransaction(record.id)">
            删除
          </a-button>
        </a-space>
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
    const res = await TransactionControllerService.listTransactionVoByPageUsingPost(
        searchParams.value
    );
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
    width: 70,
  },
  {
    title: "客户ID",
    dataIndex: "userId",
    width: 150,
  },
  {
    title: "消费金额",
    dataIndex: "amount",
    width: 70,
  },
  {
    title: "消费描述",
    dataIndex: "description",
    ellipsis: true,
    tooltip: true,
    width: 280,
  },
  {
    title: "消费时间",
    slotName: "createTime",
    width: 100,
  },
  {
    slotName: "optional",
    width: 150,
  },
];

const onPageChange = (page: number) => {
  searchParams.value = {
    ...searchParams.value,
    current: page,
  };
};

const router = useRouter();

const toTransactionUpdatePage = (transaction: Transaction) => {
  router.push({
    path: `/transaction/update`,
    query: { id: transaction.id },
  });
};

const toTransactionPage = () => {
  router.push({
    path: `/transaction/add`,
  });
};

/**
 * 确认搜索，重新加载数据
 */
const doSubmit = () => {
  searchParams.value = {
    ...searchParams.value,
    current: 1,
  };
  loadData();
};


const deleteTransaction = async (id: number) => {
  try {
    const res = await TransactionControllerService.deleteTransactionUsingPost({
      id,
    });
    if (res.code === 0) {
      message.success("删除成功");
      loadData(); // 重新加载数据以刷新表格
    } else {
      message.error("删除失败，" + res.message);
    }
  } catch (error) {
    message.error("删除过程中发生错误");
    console.error(error);
  }
};

</script>

<style scoped>
#customersView {
  max-width: 1280px;
  margin: 0 auto;
}
</style>
