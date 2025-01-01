<template>
  <div class="addTransactionView">
    <a-form :model="form" :style="{ width: '600px'}">
      <a-form-item field="userId" label="用户">
        <a-select
            v-model="form.userId"
            placeholder="请选择"
            :options="userOptions"
            style="width: 100%;"
        />
      </a-form-item>
      <a-form-item field="amount" label="消费金额">
        <a-input v-model="form.amount" placeholder="请输入" />
      </a-form-item>
      <a-form-item field="description" label="描述">
        <a-input v-model="form.description" placeholder="请输入" />
      </a-form-item>
      <div style="margin-top: 16px" />
      <a-form-item>
        <a-button type="primary" style="min-width: 200px" @click="doSubmit">
          提交
        </a-button>
      </a-form-item>
    </a-form>
  </div>
</template>

<script setup lang="ts">
import { onMounted, ref } from "vue";
import { TransactionControllerService, UserControllerService } from "../../../generated";
import message from "@arco-design/web-vue/es/message";
import { useRoute, useRouter } from "vue-router";

const route = useRoute();
const router = useRouter();

const updatePage = route.path.includes("update");

const form = ref({
  userId: undefined,
  amount: undefined,
  description: "",
});

const userOptions = ref([]); // 用户下拉选项

/**
 * 加载用户列表
 */
const loadUserOptions = async () => {
  const res = await UserControllerService.listUserVoByPageUsingPost({ pageSize: 20});
  console.log("Records from API:", res.data.records);
  if (res.code === 0) {
    userOptions.value = res.data.records
        .filter((user: any) => user.userRole === "user")
        .map((user: any) => ({
          label: `${user.id} (${user.userName})`, // 显示 ID 和昵称
          value: user.id, // 绑定到输入框的值
        }));
    console.log("User Options:", userOptions.value);
  } else {
    message.error("加载用户列表失败，" + res.message);
  }
};

/**
 * 根据事务 ID 获取旧的数据
 */
const loadData = async () => {
  const id = route.query.id;
  if (!id) {
    return;
  }
  const res = await TransactionControllerService.getTransactionVoByIdUsingGet(id as any);
  if (res.code === 0) {
    form.value = {
      userId: res.data?.userId,
      amount: res.data?.amount,
      description: res.data?.description,
      id: res.data?.id,
    } as any;
  } else {
    message.error("加载失败，" + res.message);
  }
};

onMounted(() => {
  if (updatePage) {
    loadData();
  }
  loadUserOptions(); // 加载用户列表
});

const doSubmit = async () => {
  if (updatePage) {
    const res = await TransactionControllerService.updateTransactionUsingPost(form.value);
    if (res.code === 0) {
      message.success("更新成功");
      router.push("/transaction_admin");
    } else {
      message.error("更新失败，" + res.message);
    }
  } else {
    const res = await TransactionControllerService.addTransactionUsingPost(form.value);
    if (res.code === 0) {
      message.success("创建成功");
      router.push("/transaction_admin");
    } else {
      message.error("创建失败，" + res.message);
    }
  }
};
</script>



<style scoped>
.addTransactionView {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 50px;
}
</style>
