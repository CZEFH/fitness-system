<template>
  <a-row id="globalheader" align="center" :wrap="false" style="">
    <a-col flex="auto">
      <a-menu
        mode="horizontal"
        :selected-keys="selectedKeys"
        @menu-item-click="doMenuClick"
      >
        <a-menu-item
          key="0"
          :style="{ padding: 0, marginRight: '38px' }"
          disabled
        >
          <div class="title-bar">
          </div>
        </a-menu-item>
        <a-menu-item v-for="item in visibleRoutes" :key="item.path">
          {{ item.name }}
        </a-menu-item>
      </a-menu>
    </a-col>
    <a-col flex="100px">
        <a-space size="large">
          <a-dropdown>
            <a-button style="background-color: white;">{{ store.state.user?.loginUser?.userName ?? "未登录" }}</a-button>
            <template #content>
              <a-doption @click="logout">退出</a-doption>
            </template>
          </a-dropdown>
        </a-space>
    </a-col>
  </a-row>
</template>

<script setup lang="ts">
import { routes } from "../router/routes";
import { useRoute, useRouter } from "vue-router";
import { computed, ref } from "vue";
import { useStore } from "vuex";
import checkAccess from "@/access/checkAccess";
import ACCESS_ENUM from "@/access/accessEnum";
import {UserControllerService} from "../../generated";

const router = useRouter();
// 默认主页
const selectedKeys = ref(["/"]);
const store = useStore();

// 退出登录方法
const logout = async () => {
  try {
    // 调用退出 API
    const response = await UserControllerService.userLogoutUsingPost();
    // 如果退出成功，跳转到登录页
    if (response) {
      router.push('/user/login'); // 路由跳转到登录页
    }
  } catch (error) {
    // 错误处理
    console.error('Logout failed:', error);
  }
};

// 展示在菜单的路由数组
const visibleRoutes = computed(() => {
  return routes.filter((item, index) => {
    if (item.meta?.hideInMenu) {
      return false;
    }
    // 根据权限过滤菜单
    if (
      !checkAccess(store.state.user.loginUser, item?.meta?.access as string)
    ) {
      return false;
    }
    return true;
  });
});

router.afterEach((to, from, failure) => {
  selectedKeys.value = [to.path];
});

const doMenuClick = (key: string) => {
  router.push({
    path: key,
  });
};

store.dispatch("user/getLoginUser", {
  userName: "zyb",
  userRole: ACCESS_ENUM.ADMIN,
});
</script>

<style scoped>
.title-bar {
  display: flex;
  align-items: center;
}

.logo {
  height: 48px;
}

.title {
  color: #444;
  margin-left: 10px;
}
</style>
