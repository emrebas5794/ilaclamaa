


$(document).on("click", "#btn-login", function () {
    var username = $("#form-username").val();
    var password = $("#form-password").val();
    $.ajax({
        url: "../../Main/logincontrol",
        data: {
            KullaniciAdi: username,
            Sifre: password
        },
        type:"post",
        success: function (k) {
            var a = JSON.parse(k);
              if (Object.keys(a).length>0) {
                window.location.href = "../../Main/Index?Id="+a.Id;
                return;
            }
            else{
                swal("Hata!", "Üzgünüz bilgileriniz yanlış!", "error");
                location.reload();
                return;
            }
        }
    });
});