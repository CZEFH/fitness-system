package com.yupi.oj.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yupi.oj.model.dto.transaction.TransactionQueryRequest;
import com.yupi.oj.model.entity.Transaction;
import com.yupi.oj.model.entity.Transaction;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yupi.oj.model.vo.TransactionVO;

import javax.servlet.http.HttpServletRequest;

/**
* @author Administrator
* @description 针对表【transaction(消费记录)】的数据库操作Service
* @createDate 2024-12-24 14:06:14
*/
public interface TransactionService extends IService<Transaction> {

    /**
     * 校验
     *
     * @param transaction
     * @param add
     */
    void validTransaction(Transaction transaction, boolean add);

    /**
     * 获取查询条件
     *
     * @param transactionQueryRequest
     * @return
     */
    QueryWrapper<Transaction> getQueryWrapper(TransactionQueryRequest transactionQueryRequest);


    /**
     * 获取消费封装
     *
     * @param transaction
     * @param request
     * @return
     */
    TransactionVO getTransactionVO(Transaction transaction, HttpServletRequest request);

    /**
     * 分页获取消费封装
     *
     * @param transactionPage
     * @param request
     * @return
     */
    Page<TransactionVO> getTransactionVOPage(Page<Transaction> transactionPage, HttpServletRequest request);
}
