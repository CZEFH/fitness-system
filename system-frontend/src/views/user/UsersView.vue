<template>
  <div id="customersView">
    <a-form :model="searchParams" layout="inline">
      <a-form-item field="name" label="用户呢称" style="min-width: 280px">
        <a-input v-model="searchParams.userName" placeholder="请输入" />
      </a-form-item>
      <a-form-item>
        <a-button type="primary" @click="doSubmit">提交</a-button>
      </a-form-item>
      <div style="display: flex; justify-content: flex-end; min-width:860px">
        <a-button type="primary" style="min-width: 100px" @click="toUserPage">
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
          <a-button type="primary" @click="toUserUpdatePage(record)">
            修改
          </a-button>
          <a-button type="outline" @click="deleteUser(record.id)">
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
  Page_User_,
  User, UserControllerService,
  UserQueryRequest,
} from "../../../generated";
import message from "@arco-design/web-vue/es/message";
import { useRouter } from "vue-router";
import moment from "moment";
import {IconPlus} from "@arco-design/web-vue/es/icon";

const tableRef = ref();

const dataList = ref([]);
const total = ref(0);
const searchParams = ref<UserQueryRequest>({
  pageSize: 10,
  current: 1,
});

const loadData = async () => {
  const res = await UserControllerService.listUserVoByPageUsingPost(
    searchParams.value
  );
  if (res.code === 0) {
    const filteredData = res.data.records.filter((item) => item.userRole === 'user');
    dataList.value = filteredData;
    total.value = res.data.total;
  } else {
    message.error("加载失败，" + res.message);
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
    title: "用户ID",
    dataIndex: "id",
    width: 350,
  },
  {
    title: "用户昵称",
    dataIndex: "userName",
    width: 350,
  },
  {
    title: "创建时间",
    slotName: "createTime",
    width: 350,
  },
  {
    slotName: "optional",
  },
];

const onPageChange = (page: number) => {
  searchParams.value = {
    ...searchParams.value,
    current: page,
  };
};

const router = useRouter();

/**
 * 跳转到页面
 * @param user
 */
const toUserUpdatePage = (user: User) => {
  router.push({
    path: `/update/user`,
    query: { id: user.id },
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
};

/**
 * 跳转到注册页面
 * @param user
 */
const toUserPage = () => {
  router.push({
    path: `/register`,
  });
};

const deleteUser = async (id: number) => {
  try {
    const res = await UserControllerService.deleteUserUsingPost({
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
