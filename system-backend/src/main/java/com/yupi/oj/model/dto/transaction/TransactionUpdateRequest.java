package com.yupi.oj.model.dto.transaction;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import org.jetbrains.annotations.NotNull;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 更新请求
 *
 */
@Data
public class TransactionUpdateRequest implements Serializable {

    /**
     * 消费记录id
     */
    private Long id;

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