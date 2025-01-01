package com.yupi.oj.model.dto.transaction;


import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;


/**
 * 编辑请求
 *
 */
@Data
public class TransactionEditRequest implements Serializable {

    /**
     * 消费记录id
     */
    private Long id;

    /**
     * 消费金额
     */
    private BigDecimal amount;

    /**
     * 消费描述
     */
    private String description;
}