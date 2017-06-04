<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
import = "java.util.*"
import = "dao.*"
import = "general.*"
%>
		<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<META name="GENERATOR" content="IBM WebSphere Studio">
		<META http-equiv="Content-Style-Type" content="text/css">

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
%>	
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Insert title here</title>
<style type='text/css'>
</style>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.2/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.2/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.5.2/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
</HEAD>
<BODY >
<br>
<center>
<table id="dg" class="easyui-datagrid" style="width:80%;height:550px"  
    url="akunupd.jsp"   
    title="Daftar Akun"  
    toolbar="#toolbar" 
	fitColumns="true" 
	singleSelect="true"   
	pageSize=20
    pagination="true" >   
    <thead>    
        <tr>             
			<th field="kdakun" width="10%">Kode Akun</th>
			<th field="nmakun" width="20%">Nama Akun</th>
			             
        </tr>   
    </thead>    
</table> 
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">Data Baru</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">Ubah Data</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">Hapus Data</a>
	</div> 

	<div id="dlg" class="easyui-dialog" style="width:60%;height:200px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">Akun Information</div>
		<form id="fm" method="post" >
			<table width="80%">
				<tr>
					<td>Kode Akun</td>
					<td>:</td>
					<td><input name="kdakun" id="kdakun" class="easyui-numberbox"  data-options="required:true"  style="width:100px;"></td>
				</tr>
				<tr>
					<td>Nama Akun</td>
					<td>:</td>
					<td><input name="nmakun" class="easyui-textbox" required="true" style="width:300px;"></td>
				</tr>
													
			</table>
			<input type="hidden" name="tombol" id="update" value="">			
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">Save</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
	</div>
		 
	<script type="text/javascript">
		var url;
		function newUser(){
//			document.getElementById("update").value="Insert Data";
			var str = "Insert Data";
			document.getElementById('update').value = str;
			$('#kdakun').numberbox('readonly',false)
			$('#dlg').dialog('open').dialog('setTitle','New Akun');
			$('#fm').form('clear');
			url = 'akunins.jsp';
		}
		function editUser(){
//			document.getElementById("update").value="Update Data";
			var str = "Update Data";
			document.getElementById('update').value = str;
			$('#kdakun').numberbox('readonly',true)
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','akun_tbl Form(Edit)');
				$('#fm').form('load',row);
				url = 'akunins.jsp';
			}
		}
		function saveUser(){
			$('#fm').form('submit',{
				url: url,
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(result){
					var result = eval('('+result+')');
					if (result.errorMsg){
						$.messager.show({
							title: 'Error',
							msg: result.errorMsg
						});
					} else {
						$('#dlg').dialog('close');		// close the dialog
						$('#dg').datagrid('reload');	// reload the user data
					}
				}
			});
		}
		function destroyUser(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				var str = "Delete Data";
				$.messager.confirm('Confirm','Are you sure you want to delete data?',function(r){
					if (r){
						$.post('akunins.jsp',{kdakun:row.kdakun,tombol:str},function(result){
							if (result.success){
								$('#dg').datagrid('reload');	// reload the user data
							} else {
								$.messager.show({	// show error message
									title: 'Error',
									msg: result.errorMsg
								});
							}
						},'json');
					}
				});
			}
		}
	</script>
	<style type="text/css">
		#fm{
			margin:0;
			padding:10px 30px;
		}
		.ftitle{
			font-size:14px;
			font-weight:bold;
			padding:5px 0;
			margin-bottom:10px;
			border-bottom:1px solid #ccc;
		}
		.fitem{
			margin-bottom:5px;
		}
		.fitem label{
			display:inline-block;
			width:80px;
		}
		.fitem input{
			width:160px;
		}
	</style>	
</center>
</BODY>
</HTML>