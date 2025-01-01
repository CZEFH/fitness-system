package com.yupi.oj.model.dto.transaction;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 创建请求
 *
 */
@Data
public class TransactionAddRequest implements Serializable {

    private Long userId;

    /**
     * 消费金额
     */
    private BigDecimal amount;

    /**
     * 消费描述
     */
    private String description;

    private Date createTime;

    private static final long serialVersionUID = 1L;
}