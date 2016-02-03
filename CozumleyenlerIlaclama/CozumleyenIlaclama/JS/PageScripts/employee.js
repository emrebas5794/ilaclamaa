/// <reference path="../../Scripts/jquery-2.1.4.js" />

var pg1 = $("#p-g-1");
var pg11 = $("#p-g-11").oUploader({
    maxSize: 2048,
    allowMultiple: false,
    trigger: "manual",
    customFileTypes: "image/*"
});

var pg2 = $("#p-g-2").dxTextBox({ placeholder: 'Ad giriniz', readOnly: true, valueChangeEvent: "keyup", onValueChanged: function (e) { pg2.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var pg3 = $("#p-g-3").dxTextBox({ placeholder: 'Soyad giriniz', readOnly: true, valueChangeEvent: "keyup", onValueChanged: function (e) { pg3.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var pg4 = $("#p-g-4").dxTextBox({ placeholder: 'Şifre giriniz', isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var pg10 = $("#p-g-10").dxTextBox({ placeholder: 'Tekrar şifreyi giriniz', isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var pg5 = $("#p-g-5").dxTextBox({ placeholder: 'Arac Plakası giriniz', readOnly: true, valueChangeEvent: "keyup", onValueChanged: function (e) { pg5.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');

var pg6 = $("#p-g-6").dxTagBox({ placeholder: 'Bölge seçiniz', isValid: false, readOnly: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTagBox('instance');

var def1 = $.Deferred();
$.ajax({
    url: "../../Main/Regions_GET",
    success: function (data) {
        var regions = JSON.parse(data);
        $("#p-g-6").dxTagBox({
            dataSource: regions,
            valueExpr: 'Id',
            displayExpr: 'Bolge'
        });
        def1.resolve(regions);
    }
});
var pg7 = $("#p-g-7").dxTextArea({ placeholder: 'Açık adres giriniz', isValid: false, maxLength: 200, height: 100, readOnly: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextArea('instance');
var pg8 = $("#p-g-8").dxTextBox({ placeholder: 'Email giriniz', isValid: false, readOnly: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var pg9 = $("#p-g-9").dxTextBox({ placeholder: 'Telefon numarası giriniz', isValid: false, mask: '(000) 000 - 0000', readOnly: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');

topMenuItems = [
       {
           icon: "fa fa-pencil-square-o",
           caption: "Düzenlemeyi Etkinleştir",
           onclick: function () {
               $(this).children(".t-caption").toggleText("Düzenlemeyi Etkinleştir", "Düzenlemeyi Bitir")
               if ($(this).children(".t-caption").text() == "Düzenlemeyi Etkinleştir") {
                   ReadOnlyYap("true");
                   $("#p-guncelle").css("display", "none");
                   $("#p-guncelleiptal").css("display", "none");
                   $("#psifre").css("display", "none");
                   $("#presim").css("display", "none");
                   $("#p-guncelleiptal").click();

               }
               else if ($(this).children(".t-caption").text() == "Düzenlemeyi Bitir") {
                   ReadOnlyYap("false");
                   $("#p-guncelle").css("display", "block");
                   $("#p-guncelleiptal").css("display", "block");
                   $("#psifre").css("display", "block");
                   $("#presim").css("display", "block");
               }

           }
       }]
$(document).ready(function () {
    def1.done(function (ev1) {
       
        pg1.children("img").attr("src", employee[0].Fotograf).addClass("imgPersonel");
        pg2.option("value", employee[0].Ad);
        pg3.option("value", employee[0].Soyad);
        pg4.option("value", employee[0].Sifre);
        pg5.option("value", employee[0].AracPlaka);
        pg6.option("values", employee[0].BolgeId.split(","));
        pg7.option("value", employee[0].Adres);
        pg8.option("value", employee[0].Email);
        pg9.option("value", employee[0].CepTel);

    });

});

$(document).on("click", "#p-guncelle", function () {
    if (checkallvalid([pg2, pg3, pg4, pg5, pg6, pg7, pg8, pg9])) {
        var personeldata = new FormData();
        var image = $("#p-g-11").oUploader("instance").getFiles();

        if (image.length<1) {
            personeldata.append("Resim", $('.imgPersonel').attr('src'));
        }
        else {
            personeldata.append("Resim", image[0]);
        }
        var bolge=pg6.option("values").toString();
        personeldata.append("Id",employee[0].Id)
        personeldata.append("Ad", pg2.option("value"));
        personeldata.append("Soyad", pg3.option("value"));
        personeldata.append("Sifre", pg4.option("value"));
        personeldata.append("AracPlaka", pg5.option("value"));
        personeldata.append("BolgeId", bolge);
        personeldata.append("Adres", pg7.option("value"));
        personeldata.append("Email", pg8.option("value"));
        personeldata.append("CepTel", pg9.option("value"));
        $.ajax({
            url: "../../Main/Employee_UPDATE_DATA",
            type: "POST",
            data: personeldata,
            cache: false,
            processData: false,
            contentType: false,
            success: function() {
                swal({ title: "Müşteri başarı ile güncellendi", type: "success", timer: 1000, showConfirmButton: false })
                setTimeout(function () { window.location.reload();}, 500);
            }
        });
    }
    else {
        swal("Lütfen formu eksiksiz doldurunuz!!", "", "error");
    }
  
});
$(document).on("click", "#p-guncelleiptal", function () {
    $("#p-g-11").oUploader("instance").destroy();
    $("#p-g-11").oUploader({
        maxSize: 2048,
        allowMultiple: false,
        trigger: "manual",
        customFileTypes: "image/*"
    });
    pg2.option('value', employee[0].Ad);
    pg3.option('value', employee[0].Soyad);
    pg4.option('value', employee[0].Sifre);
    pg5.option('value', employee[0].AracPlaka);
    pg6.option('values', employee[0].BolgeId);
    pg7.option('value', employee[0].Adres);
    pg8.option('value', employee[0].Email);
    pg9.option('value', employee[0].CepTel);
 
});


jQuery.fn.extend({
    toggleText: function (a, b) {
        var that = this;
        if (that.text() != a && that.text() != b) {
            that.text(a);
        }
        else
            if (that.text() == a) {
                that.text(b);
            }
            else
                if (that.text() == b) {
                    that.text(a);
                }
        return this;
    }
});

function ReadOnlyYap(type) {
    var ss = $("#readOnlySelector").find(".dx-widget");
    for (var i = 0; i < ss.length; i++) {
        var dd = $(ss[i]).data();

        if (dd.dxComponents != undefined) {
            eval("$(ss[i])." + dd.dxComponents[0] + "('instance').option({readOnly:" + type + "})");
        }
    }
}



function checkallvalid(arr) {
    var bool = true;
    $.each(arr, function (k, v) {
        if (!v.option('isValid')) {
            bool = false;
            return false;
        }
    });
    return bool;
}

function EmployeeOne() {
    $.ajax({
        url: "../../Main/EmployeeOne",
        data: {
            Id: employee[0].Id
        },
        type: "POST",
        success: function (data) {
            employee = JSON.parse(data);
        }
    });
}