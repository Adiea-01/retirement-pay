var editFlag;
var removeFlag;
var prefix = ctx + "retirement/type";
$(function () {

    queryList();
});

function queryList() {
    var options = {
        url: prefix + "/queryAll",
        createUrl: prefix + "/index/add",
        updateUrl: prefix + "/index/edit/?id={id}",
        removeUrl: prefix + "/deleteById",
        // exportUrl: prefix + "/upload",
        importUrl: prefix + "/upload",
        // importTemplateUrl: prefix + "/upload",
        sortName: "createTime",
        sortOrder: "desc",
        modalName: "离退休",
        columns: [
            {
                width:"5%",
                checkbox: true
            },
            {
                width:"20%",
                field: 'retirementName',
                title: '离退休名称',
                sortable: false
            },
            {
                width:"20%",
                field: 'defaultFlag',
                title: '当前默认',
                formatter: function (value, row, index) {
                    var actions = [];
                    if(row.defaultFlag==0){
                        actions.push('<a class="btn btn-success btn-xs" onclick="setDefaultFlag(\'' + row.id + '\')"><i class="fa fa-check-square-o"></i> 设为默认</a> ');
                    }else {
                        actions.push('<a class="btn btn-default btn-xs" disabled="disabled"> 默认</a>');
                    }
                    return actions.join('');
                }
            },
            {
                width:"20%",
                field: 'createDate',
                title: '创建时间',
                sortable: false
            },
            {
                width:"20%",
                title: '操作',
                align: 'center',
                formatter: function (value, row, index) {
                    var actions = [];
                    actions.push('<a class="btn btn-success btn-xs ' + editFlag + '" href="javascript:void(0)" onclick="$.operate.edit(\'' + row.id + '\',800,250)"><i class="fa fa-edit"></i> 编辑</a> ');
                    actions.push('<a class="btn btn-danger btn-xs ' + removeFlag + '" href="javascript:void(0)" onclick="$.operate.remove(\'' + row.id + '\')"><i class="fa fa-remove"></i> 删除</a> ');
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
