var detailFlag;
var prefix = ctx + "retirement/payroll";
$(function () {
    queryList();
});

function queryList() {
    var options = {
        url: prefix + "/queryAll",
        detailUrl: prefix + "/index/payDetail?id={id}",
        sortName: "createTime",
        sortOrder: "desc",
        modalName: "工资列表",
        columns: [
            {
                width:"5%",
                checkbox: true
            },
            {
                width:"20%",
                field: 'personnelNumber',
                title: '人员编号',
                sortable: false
            },
            {
                width:"20%",
                field: 'department',
                title: '单位',
                sortable: false
            },
            {
                width:"20%",
                field: 'realName',
                title: '姓名',
                sortable: false
            },
            {
                width:"20%",
                field: 'payDate',
                title: '支付日期',
                sortable: false
            },
            {
                width:"20%",
                field: 'view',
                title: '是否查看',
                sortable: false,
                formatter: function (value, row, index) {
                    var actions = [];
                    if(row.view==1){
                        actions.push('<a class="btn btn-success btn-xs" disabled="disabled"> 已查看</a> ');
                    }else {
                        actions.push('<a class="btn btn-default btn-xs" disabled="disabled"> 未查看</a>');
                    }
                    return actions.join('');
                }
            },
            {
                width:"20%",
                field: 'viewDate',
                title: '查看日期',
                sortable: false
            },
            {
                width:"20%",
                field: 'retirementName',
                title: '离退休工资类型',
                sortable: false
            },
            {
                width:"20%",
                field: 'createDate',
                title: '创建时间',
                sortable: false
            },
            {
                width:"20%",
                field: 'detailFlag',
                title: '操作',
                sortable: false,
                formatter: function (value, row, index) {
                    var actions = [];
                    actions.push('<a class="btn btn-warning btn-xs ' + detailFlag + '" href="javascript:void(0)" onclick="$.operate.detail(\'' + row.id + '\')"><i class="fa fa-search"></i> 查看详细</a>');
                    return actions.join('');
                }
            }]
    };
    $.table.init(options);
}


/* 修改当前默认 */
function setDefaultFlag(id) {
    $.ajax({
        url: "./updateDefaultFlag",
        type: "post",
        data: {"id": id},
        dataType: "json",
        async: false,
        beforeSend: function () {
            $.modal.loading("正在处理中，请稍后...");
        },
        success: function(result) {
            console.log(result);
            if(result.code==0){
                $.modal.reload();
            }
        },error:function () {
            $.modal.closeLoading();
        }
    });
}
