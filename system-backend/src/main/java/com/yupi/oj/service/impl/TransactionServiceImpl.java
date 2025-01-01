package com.yupi.oj.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yupi.oj.common.ErrorCode;
import com.yupi.oj.constant.CommonConstant;
import com.yupi.oj.exception.BusinessException;
import com.yupi.oj.exception.ThrowUtils;
import com.yupi.oj.mapper.TransactionMapper;
import com.yupi.oj.model.dto.transaction.TransactionQueryRequest;
import com.yupi.oj.model.entity.Transaction;
import com.yupi.oj.model.entity.User;
import com.yupi.oj.model.vo.TransactionVO;
import com.yupi.oj.model.vo.UserVO;
import com.yupi.oj.service.TransactionService;
import com.yupi.oj.service.UserService;
import com.yupi.oj.utils.SqlUtils;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.sort.SortBuilder;
import org.elasticsearch.search.sort.SortBuilders;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

/**
* @author Administrator
* @description 针对表【transaction(消费记录)】的数据库操作Service实现
* @createDate 2024-12-24 14:06:14
*/
@Service
public class TransactionServiceImpl extends ServiceImpl<TransactionMapper, Transaction> implements TransactionService{

    @Resource
    private UserService userService;

    @Override
    public void validTransaction(Transaction transaction, boolean add) {
        if (transaction == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        BigDecimal amount = transaction.getAmount();
        String description = transaction.getDescription();
        // 创建时，参数不能为空
        if (add) {
            ThrowUtils.throwIf(StringUtils.isAnyBlank(description), ErrorCode.PARAMS_ERROR);
            ThrowUtils.throwIf(amount == null || amount.compareTo(BigDecimal.ZERO) == 0, ErrorCode.PARAMS_ERROR);
        }
        // 有参数则校验
        if (StringUtils.isNotBlank(description) && description.length() > 8192) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "内容过长");
        }
    }

    /**
     * 获取查询包装类
     *
     * @param transactionQueryRequest
     * @return
     */
    @Override
    public QueryWrapper<Transaction> getQueryWrapper(TransactionQueryRequest transactionQueryRequest) {
        QueryWrapper<Transaction> queryWrapper = new QueryWrapper<>();
        if (transactionQueryRequest == null) {
            return queryWrapper;
        }
        Long id = transactionQueryRequest.getId();
        Long userId = transactionQueryRequest.getUserId();
        String sortField = transactionQueryRequest.getSortField();
        String sortOrder = transactionQueryRequest.getSortOrder();
        queryWrapper.eq(ObjectUtils.isNotEmpty(id), "id", id);
        queryWrapper.eq(ObjectUtils.isNotEmpty(userId), "userId", userId);
        queryWrapper.orderBy(SqlUtils.validSortField(sortField), sortOrder.equals(CommonConstant.SORT_ORDER_ASC),
                sortField);
        return queryWrapper;
    }

    @Override
    public TransactionVO getTransactionVO(Transaction transaction, HttpServletRequest request) {
        TransactionVO transactionVO = TransactionVO.objToVo(transaction);
        // 1. 关联查询用户信息
        Long userId = transaction.getUserId();
        User user = null;
        if (userId != null && userId > 0) {
            user = userService.getById(userId);
        }
        UserVO userVO = userService.getUserVO(user);
        transactionVO.setUserVO(userVO);
        return transactionVO;
    }

    @Override
    public Page<TransactionVO> getTransactionVOPage(Page<Transaction> transactionPage, HttpServletRequest request) {
        List<Transaction> transactionList = transactionPage.getRecords();
        Page<TransactionVO> transactionVOPage = new Page<>(transactionPage.getCurrent(), transactionPage.getSize(), transactionPage.getTotal());
        if (CollUtil.isEmpty(transactionList)) {
            return transactionVOPage;
        }
        // 1. 关联查询用户信息
        Set<Long> userIdSet = transactionList.stream().map(Transaction::getUserId).collect(Collectors.toSet());
        Map<Long, List<User>> userIdUserListMap = userService.listByIds(userIdSet).stream()
                .collect(Collectors.groupingBy(User::getId));
        // 填充信息
        List<TransactionVO> transactionVOList = transactionList.stream().map(transaction -> {
            TransactionVO transactionVO = TransactionVO.objToVo(transaction);
            Long userId = transaction.getUserId();
            User user = null;
            if (userIdUserListMap.containsKey(userId)) {
                user = userIdUserListMap.get(userId).get(0);
            }
            transactionVO.setUserVO(userService.getUserVO(user));
            return transactionVO;
        }).collect(Collectors.toList());
        transactionVOPage.setRecords(transactionVOList);
        return transactionVOPage;
    }
}




