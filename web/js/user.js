//CKEDITOR.replace("erpbundle_users[description]");
//CKEDITOR.replace("erpbundle_users[price]");
//CKEDITOR.replace("erpbundle_users[Portfolio]");
//CKEDITOR.replace("erpbundle_users[skill]");


$('textarea').each(function(){
   var name = $(this).attr('name');
    CKEDITOR.replace(name);
});