<template>
  <div class="addUserView">
    <a-form :model="form" :style="{ width: '600px'}">
      <a-form-item field="userAccount" label="账号">
        <a-input v-model="form.userAccount" placeholder="请输入" />
      </a-form-item>
      <a-form-item field="userAccount" label="呢称">
        <a-input v-model="form.userName" placeholder="请输入" />
      </a-form-item>
      <a-form-item field="userPassword" tooltip="密码不少于 8 位" label="密码">
        <a-input-password
            v-model="form.userPassword"
            placeholder="请输入"
        />
      </a-form-item>
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
import { UserControllerService } from "../../../generated";
import message from "@arco-design/web-vue/es/message";
import {useRoute, useRouter} from "vue-router";

const route = useRoute();
const router = useRouter();
// 如果页面地址包含 update，视为更新页面
const updatePage = route.path.includes("update");

const form = ref({
  userAccount: "",
  userPassword: "",
  userName: "",
  createTime: "",
});

/**
 * 根据事务 ID 获取旧的数据
 */
const loadData = async () => {
  const id = route.query.id;
  if (!id) {
    return;
  }
  const res = await UserControllerService.getUserVoByIdUsingGet(
      id as any
  );
  if (res.code === 0) {
    form.value = {
      userAccount: res.data?.userAccount,
      userName: res.data?.userName,
      userPassword: res.data?.userPassword,
      createTime: res.data?.createTime,
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
});

const doSubmit = async () => {
  const res = await UserControllerService.updateUserUsingPost(
      form.value
  );
  console.log(res.code);
  if (res.code === 0) {
    message.success("更新成功");
    router.push("/");
  } else {
    message.error("更新失败，" + res.message);
  }
};
</script>

<style scoped>
.addUserView {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 50px;
}
</style>