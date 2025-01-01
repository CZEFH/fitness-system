package com.yupi.oj.model.vo;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yupi.oj.model.entity.Transaction;
import lombok.Data;
import org.springframework.beans.BeanUtils;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 消费记录
 * @TableName transaction
 */
@TableName(value ="transaction")
@Data
public class TransactionVO implements Serializable {

    /**
     * 消费记录id
     */
    private Long id;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 消费金额
     */
    private BigDecimal amount;

    /**
     * 消费描述
     */
    private String description;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 创建题目人的信息
     */
    private UserVO userVO;

    /**
     * 包装类转对象
     *
     * @param transactionVO
     * @return
     */
    public static Transaction voToObj(TransactionVO transactionVO) {
        if (transactionVO == null) {
            return null;
        }
        Transaction transaction = new Transaction();
        BeanUtils.copyProperties(transactionVO, transaction);
        return transaction;
    }

    /**
     * 对象转包装类
     *
     * @param transaction
     * @return
     */
    public static TransactionVO objToVo(Transaction transaction) {
        if (transaction == null) {
            return null;
        }
        TransactionVO transactionVO = new TransactionVO();
        BeanUtils.copyProperties(transaction, transactionVO);
        return transactionVO;
    }

    private static final long serialVersionUID = 1L;
}