package com.yupi.oj.model.dto.transaction;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.yupi.oj.common.PageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 查询请求
 *

 */
@EqualsAndHashCode(callSuper = true)
@Data
public class TransactionQueryRequest extends PageRequest implements Serializable {

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

    private static final long serialVersionUID = 1L;
}