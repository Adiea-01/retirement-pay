var editFlag;
var removeFlag;
var resetPwdFlag;
var prefix = ctx + "system/user/";
$(function () {

    queryList();
});

function queryList() {
    var options = {
        url: prefix + "/queryAll",
        createUrl: prefix + "/index/add",
        updateUrl: prefix + "/index/edit/?id={id}",
        removeUrl: prefix + "/deleteById",
        exportUrl: prefix + "/export",
        importUrl: prefix + "/importData",
        importTemplateUrl: prefix + "/importTemplate",
        sortName: "createTime",
        sortOrder: "desc",
        modalName: "用户",
        columns: [
            {
                width:"5%",
                checkbox: true
            },
            {
                width:"20%",
                field: 'department',
                title: '单位',
                sortable: false
            },
            {
                width:"20%",
                field: 'identityCard',
                title: '登录账号',
                sortable: false
            },
            {
                width:"20%",
                field: 'realName',
                title: '用户名'
            },
            {
                width:"20%",
                visible: true,
                title: '用户状态',
                align: 'center',
                formatter: function (value, row, index) {
                    return statusTools(row);
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
                    actions.push('<a class="btn btn-success btn-xs ' + editFlag + '" href="javascript:void(0)" onclick="$.operate.edit(\'' + row.id + '\',800,400)"><i class="fa fa-edit"></i> 编辑</a> ');
                    actions.push('<a class="btn btn-danger btn-xs ' + removeFlag + '" href="javascript:void(0)" onclick="$.operate.remove(\'' + row.id + '\')"><i class="fa fa-remove"></i> 删除</a> ');
                    actions.push('<a class="btn btn-warning btn-xs ' + resetPwdFlag + '" href="javascript:void(0)" onclick="resetPwd1(\'' + row.id + '\')"><i class="fa fa-key"></i> 重置密码</a> ');
                    return actions.join('');
                }
            }]
    };
    $.table.init(options);
}


/* 用户状态显示 */
function statusTools(row) {
    if (row.status == 1) {
        return '<span class="badge badge-primary">开启</span>';
    } else {
        return '<span class="badge badge-light">关闭</span>';
    }
}


/* 用户管理-重置密码 */
function resetPwd1(id) {
    var url = prefix + 'resetPwd1?id=' + id;
    layer.confirm("确认是否重置密码?", {
        icon: 3,
        title: "系统提示",
        btn: ['确认', '取消']
    }, function (index) {
        reset(url);
    });
}
/*重置密码回调函数*/
function reset(url) {
    $.ajax({
        url: url,
        type: "GET",
        dataType: "json",
        async: false,
        success: function (data) {
            $.modal.msgSuccess(data.msg)
        },
        error: function (msg) {
            $.modal.msgError(data.msg)
        }

    })
}


