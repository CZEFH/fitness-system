/* generated using openapi-typescript-codegen -- do not edit */
/* istanbul ignore file */
/* tslint:disable */
/* eslint-disable */
import type { BaseResponse_boolean_ } from '../models/BaseResponse_boolean_';
import type { BaseResponse_long_ } from '../models/BaseResponse_long_';
import type { BaseResponse_Page_Transaction_ } from '../models/BaseResponse_Page_Transaction_';
import type { BaseResponse_Page_TransactionVO_ } from '../models/BaseResponse_Page_TransactionVO_';
import type { BaseResponse_TransactionVO_ } from '../models/BaseResponse_TransactionVO_';
import type { DeleteRequest } from '../models/DeleteRequest';
import type { TransactionAddRequest } from '../models/TransactionAddRequest';
import type { TransactionEditRequest } from '../models/TransactionEditRequest';
import type { TransactionQueryRequest } from '../models/TransactionQueryRequest';
import type { TransactionUpdateRequest } from '../models/TransactionUpdateRequest';
import type { CancelablePromise } from '../core/CancelablePromise';
import { OpenAPI } from '../core/OpenAPI';
import { request as __request } from '../core/request';
export class TransactionControllerService {
    /**
     * addTransaction
     * @param transactionAddRequest transactionAddRequest
     * @returns BaseResponse_long_ OK
     * @returns any Created
     * @throws ApiError
     */
    public static addTransactionUsingPost(
        transactionAddRequest: TransactionAddRequest,
    ): CancelablePromise<BaseResponse_long_ | any> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/api/transaction/add',
            body: transactionAddRequest,
            errors: {
                401: `Unauthorized`,
                403: `Forbidden`,
                404: `Not Found`,
            },
        });
    }
    /**
     * deleteTransaction
     * @param deleteRequest deleteRequest
     * @returns BaseResponse_boolean_ OK
     * @returns any Created
     * @throws ApiError
     */
    public static deleteTransactionUsingPost(
        deleteRequest: DeleteRequest,
    ): CancelablePromise<BaseResponse_boolean_ | any> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/api/transaction/delete',
            body: deleteRequest,
            errors: {
                401: `Unauthorized`,
                403: `Forbidden`,
                404: `Not Found`,
            },
        });
    }
    /**
     * editTransaction
     * @param transactionEditRequest transactionEditRequest
     * @returns BaseResponse_boolean_ OK
     * @returns any Created
     * @throws ApiError
     */
    public static editTransactionUsingPost(
        transactionEditRequest: TransactionEditRequest,
    ): CancelablePromise<BaseResponse_boolean_ | any> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/api/transaction/edit',
            body: transactionEditRequest,
            errors: {
                401: `Unauthorized`,
                403: `Forbidden`,
                404: `Not Found`,
            },
        });
    }
    /**
     * getTransactionVOById
     * @param id id
     * @returns BaseResponse_TransactionVO_ OK
     * @throws ApiError
     */
    public static getTransactionVoByIdUsingGet(
        id?: number,
    ): CancelablePromise<BaseResponse_TransactionVO_> {
        return __request(OpenAPI, {
            method: 'GET',
            url: '/api/transaction/get/vo',
            query: {
                'id': id,
            },
            errors: {
                401: `Unauthorized`,
                403: `Forbidden`,
                404: `Not Found`,
            },
        });
    }
    /**
     * listTransactionByPage
     * @param transactionQueryRequest transactionQueryRequest
     * @returns BaseResponse_Page_Transaction_ OK
     * @returns any Created
     * @throws ApiError
     */
    public static listTransactionByPageUsingPost(
        transactionQueryRequest: TransactionQueryRequest,
    ): CancelablePromise<BaseResponse_Page_Transaction_ | any> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/api/transaction/list/page',
            body: transactionQueryRequest,
            errors: {
                401: `Unauthorized`,
                403: `Forbidden`,
                404: `Not Found`,
            },
        });
    }
    /**
     * listTransactionVOByPage
     * @param transactionQueryRequest transactionQueryRequest
     * @returns BaseResponse_Page_TransactionVO_ OK
     * @returns any Created
     * @throws ApiError
     */
    public static listTransactionVoByPageUsingPost(
        transactionQueryRequest: TransactionQueryRequest,
    ): CancelablePromise<BaseResponse_Page_TransactionVO_ | any> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/api/transaction/list/page/vo',
            body: transactionQueryRequest,
            errors: {
                401: `Unauthorized`,
                403: `Forbidden`,
                404: `Not Found`,
            },
        });
    }
    /**
     * listMyTransactionVOByPage
     * @param transactionQueryRequest transactionQueryRequest
     * @returns BaseResponse_Page_TransactionVO_ OK
     * @returns any Created
     * @throws ApiError
     */
    public static listMyTransactionVoByPageUsingPost(
        transactionQueryRequest: TransactionQueryRequest,
    ): CancelablePromise<BaseResponse_Page_TransactionVO_ | any> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/api/transaction/my/list/page/vo',
            body: transactionQueryRequest,
            errors: {
                401: `Unauthorized`,
                403: `Forbidden`,
                404: `Not Found`,
            },
        });
    }
    /**
     * updateTransaction
     * @param transactionUpdateRequest transactionUpdateRequest
     * @returns BaseResponse_boolean_ OK
     * @returns any Created
     * @throws ApiError
     */
    public static updateTransactionUsingPost(
        transactionUpdateRequest: TransactionUpdateRequest,
    ): CancelablePromise<BaseResponse_boolean_ | any> {
        return __request(OpenAPI, {
            method: 'POST',
            url: '/api/transaction/update',
            body: transactionUpdateRequest,
            errors: {
                401: `Unauthorized`,
                403: `Forbidden`,
                404: `Not Found`,
            },
        });
    }
}
