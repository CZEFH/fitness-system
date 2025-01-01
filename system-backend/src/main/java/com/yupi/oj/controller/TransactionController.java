package com.yupi.oj.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yupi.oj.annotation.AuthCheck;
import com.yupi.oj.common.BaseResponse;
import com.yupi.oj.common.DeleteRequest;
import com.yupi.oj.common.ErrorCode;
import com.yupi.oj.common.ResultUtils;
import com.yupi.oj.constant.UserConstant;
import com.yupi.oj.exception.BusinessException;
import com.yupi.oj.exception.ThrowUtils;
import com.yupi.oj.model.dto.transaction.TransactionAddRequest;
import com.yupi.oj.model.dto.transaction.TransactionEditRequest;
import com.yupi.oj.model.dto.transaction.TransactionQueryRequest;
import com.yupi.oj.model.dto.transaction.TransactionUpdateRequest;
import com.yupi.oj.model.entity.Transaction;
import com.yupi.oj.model.entity.User;
import com.yupi.oj.model.vo.TransactionVO;
import com.yupi.oj.service.TransactionService;
import com.yupi.oj.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.List;

/**
 * 消费接口
 *
 */
@RestController
@RequestMapping("/transaction")
@Slf4j
public class TransactionController {

    @Resource
    private TransactionService transactionService;

    @Resource
    private UserService userService;

    // region 增删改查

    /**
     * 创建
     *
     * @param transactionAddRequest
     * @param request
     * @return
     */
    @PostMapping("/add")
    public BaseResponse<Long> addTransaction(@RequestBody TransactionAddRequest transactionAddRequest, HttpServletRequest request) {
        if (transactionAddRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Transaction transaction = new Transaction();
        BeanUtils.copyProperties(transactionAddRequest, transaction);
        transactionService.validTransaction(transaction, true);
        transaction.setUserId(transactionAddRequest.getUserId());
        boolean result = transactionService.save(transaction);
        ThrowUtils.throwIf(!result, ErrorCode.OPERATION_ERROR);
        long newTransactionId = transaction.getId();
        return ResultUtils.success(newTransactionId);
    }

    /**
     * 删除
     *
     * @param deleteRequest
     * @param request
     * @return
     */
    @PostMapping("/delete")
    public BaseResponse<Boolean> deleteTransaction(@RequestBody DeleteRequest deleteRequest, HttpServletRequest request) {
        if (deleteRequest == null || deleteRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        User user = userService.getLoginUser(request);
        long id = deleteRequest.getId();
        // 判断是否存在
        Transaction oldTransaction = transactionService.getById(id);
        ThrowUtils.throwIf(oldTransaction == null, ErrorCode.NOT_FOUND_ERROR);
        // 仅本人或管理员可删除
        if (!oldTransaction.getUserId().equals(user.getId()) && !userService.isAdmin(request)) {
            throw new BusinessException(ErrorCode.NO_AUTH_ERROR);
        }
        boolean b = transactionService.removeById(id);
        return ResultUtils.success(b);
    }

    /**
     * 更新（仅管理员）
     *
     * @param transactionUpdateRequest
     * @return
     */
    @PostMapping("/update")
    @AuthCheck(mustRole = UserConstant.ADMIN_ROLE)
    public BaseResponse<Boolean> updateTransaction(@RequestBody TransactionUpdateRequest transactionUpdateRequest) {
        if (transactionUpdateRequest == null || transactionUpdateRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Transaction transaction = new Transaction();
        BeanUtils.copyProperties(transactionUpdateRequest, transaction);
        // 参数校验
        transactionService.validTransaction(transaction, false);
        long id = transactionUpdateRequest.getId();
        // 判断是否存在
        Transaction oldTransaction = transactionService.getById(id);
        ThrowUtils.throwIf(oldTransaction == null, ErrorCode.NOT_FOUND_ERROR);
        boolean result = transactionService.updateById(transaction);
        return ResultUtils.success(result);
    }

    /**
     * 根据 id 获取
     *
     * @param id
     * @return
     */
    @GetMapping("/get/vo")
    public BaseResponse<TransactionVO> getTransactionVOById(long id, HttpServletRequest request) {
        if (id <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Transaction transaction = transactionService.getById(id);
        if (transaction == null) {
            throw new BusinessException(ErrorCode.NOT_FOUND_ERROR);
        }
        return ResultUtils.success(transactionService.getTransactionVO(transaction, request));
    }

    /**
     * 分页获取列表（仅管理员）
     *
     * @param transactionQueryRequest
     * @return
     */
    @PostMapping("/list/page")
    @AuthCheck(mustRole = UserConstant.ADMIN_ROLE)
    public BaseResponse<Page<Transaction>> listTransactionByPage(@RequestBody TransactionQueryRequest transactionQueryRequest) {
        long current = transactionQueryRequest.getCurrent();
        long size = transactionQueryRequest.getPageSize();
        Page<Transaction> transactionPage = transactionService.page(new Page<>(current, size),
                transactionService.getQueryWrapper(transactionQueryRequest));
        return ResultUtils.success(transactionPage);
    }

    /**
     * 分页获取列表（封装类）
     *
     * @param transactionQueryRequest
     * @param request
     * @return
     */
    @PostMapping("/list/page/vo")
    public BaseResponse<Page<TransactionVO>> listTransactionVOByPage(@RequestBody TransactionQueryRequest transactionQueryRequest,
            HttpServletRequest request) {
        long current = transactionQueryRequest.getCurrent();
        long size = transactionQueryRequest.getPageSize();
        // 限制爬虫
        ThrowUtils.throwIf(size > 20, ErrorCode.PARAMS_ERROR);
        Page<Transaction> transactionPage = transactionService.page(new Page<>(current, size),
                transactionService.getQueryWrapper(transactionQueryRequest));
        return ResultUtils.success(transactionService.getTransactionVOPage(transactionPage, request));
    }

    /**
     * 分页获取当前用户创建的资源列表
     *
     * @param transactionQueryRequest
     * @param request
     * @return
     */
    @PostMapping("/my/list/page/vo")
    public BaseResponse<Page<TransactionVO>> listMyTransactionVOByPage(@RequestBody TransactionQueryRequest transactionQueryRequest,
            HttpServletRequest request) {
        if (transactionQueryRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        User loginUser = userService.getLoginUser(request);
        transactionQueryRequest.setUserId(loginUser.getId());
        long current = transactionQueryRequest.getCurrent();
        long size = transactionQueryRequest.getPageSize();
        // 限制爬虫
        ThrowUtils.throwIf(size > 20, ErrorCode.PARAMS_ERROR);
        Page<Transaction> transactionPage = transactionService.page(new Page<>(current, size),
                transactionService.getQueryWrapper(transactionQueryRequest));
        return ResultUtils.success(transactionService.getTransactionVOPage(transactionPage, request));
    }

    /**
     * 编辑（用户）
     *
     * @param transactionEditRequest
     * @param request
     * @return
     */
    @PostMapping("/edit")
    public BaseResponse<Boolean> editTransaction(@RequestBody TransactionEditRequest transactionEditRequest, HttpServletRequest request) {
        if (transactionEditRequest == null || transactionEditRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Transaction transaction = new Transaction();
        BeanUtils.copyProperties(transactionEditRequest, transaction);
        String description = transactionEditRequest.getDescription();
        if (description != null) {
            transaction.setDescription(description);
        }
        // 参数校验
        transactionService.validTransaction(transaction, false);
        User loginUser = userService.getLoginUser(request);
        long id = transactionEditRequest.getId();
        // 判断是否存在
        Transaction oldTransaction = transactionService.getById(id);
        ThrowUtils.throwIf(oldTransaction == null, ErrorCode.NOT_FOUND_ERROR);
        // 仅本人或管理员可编辑
        if (!oldTransaction.getUserId().equals(loginUser.getId()) && !userService.isAdmin(loginUser)) {
            throw new BusinessException(ErrorCode.NO_AUTH_ERROR);
        }
        boolean result = transactionService.updateById(transaction);
        return ResultUtils.success(result);
    }

}
