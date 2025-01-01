import { RouteRecordRaw } from "vue-router";
import ACCESS_ENUM from "@/access/accessEnum";
import NoAuthView from "@/views/NoAuthView.vue";
import UserLayout from "@/layouts/UserLayout.vue";
import UserLoginView from "@/views/user/UserLoginView.vue";
import UserRegisterView from "@/views/user/UserRegisterView.vue";
import StatisticsView from "@/views/transaction/StatisticsView.vue";
import UserTransactionView from "@/views/transaction/UserTransactionView.vue";
import TransactionView from "@/views/transaction/TransactionView.vue";
import UsersView from "@/views/user/UsersView.vue";
import AddUserView from "@/views/user/AddUserView.vue";
import AddTransactionView from "@/views/transaction/AddTransactionView.vue";

export const routes: Array<RouteRecordRaw> = [
  {
    path: "/user",
    name: "用户",
    component: UserLayout,
    children: [
      {
        path: "/user/login",
        name: "用户登录",
        component: UserLoginView,
      },
    ],
    meta: {
      hideInMenu: true,
    },
  },
  {
    path: "/",
    name: "客户列表",
    component: UsersView,
    meta: {
      access: ACCESS_ENUM.ADMIN,
    },
  },
  {
    path: "/register",
    name: "用户注册",
    component: UserRegisterView,
    meta: {
      access: ACCESS_ENUM.ADMIN,
      hideInMenu: true,
    },
  },
  {
    path: "/transaction_admin",
    name: "消费列表",
    component: TransactionView,
    meta: {
      access: ACCESS_ENUM.ADMIN,
    },
  },
  {
    path: "/statistics",
    name: "统计明细",
    component: StatisticsView,
    meta: {
      access: ACCESS_ENUM.ADMIN,
      // hideInMenu: true,
    },
  },
  {
    path: "/transaction_user",
    name: "消费明细",
    component: UserTransactionView,
    meta: {
      access: ACCESS_ENUM.USER,
    },
  },
  {
    path: "/update/user",
    name: "更新客户信息",
    component: AddUserView,
    meta: {
      access: ACCESS_ENUM.ADMIN,
      hideInMenu: true,
    },
  },
  {
    path: "/transaction/update",
    name: "更新消费记录",
    component: AddTransactionView,
    meta: {
      access: ACCESS_ENUM.ADMIN,
      hideInMenu: true,
    },
  },
  {
    path: "/transaction/add",
    name: "添加消费记录",
    component: AddTransactionView,
    meta: {
      access: ACCESS_ENUM.ADMIN,
      hideInMenu: true,
    },
  },
  {
    path: "/noAuth",
    name: "无权限",
    component: NoAuthView,
    meta: {
      hideInMenu: true,
    },
  },
];
