///<reference path="../../Scripts/jquery-2.1.4.js" />
/// <reference path="../../External/dx.all.js" />

var pe1 = $("#p-e-1").oUploader({
    maxSize: 2048,
    allowMultiple: false,
    trigger: "manual",
    customFileTypes: "image/*"
});
var employees;

var pe2 = $("#p-e-2").dxTextBox({ placeholder: 'Ad giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { pe2.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var pe3 = $("#p-e-3").dxTextBox({ placeholder: 'Soyad giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { pe3.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var pe4 = $("#p-e-4").dxTextBox({ placeholder: 'Şifre giriniz', isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var pe10 = $("#p-e-10").dxTextBox({ placeholder: 'Tekrar şifreyi giriniz', isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var pe5 = $("#p-e-5").dxTextBox({ placeholder: 'Arac Plakası giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { pe5.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var pe6 = $("#p-e-6").dxTagBox({ placeholder: 'Bölge seçiniz', isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTagBox('instance');
var pe7 = $("#p-e-7").dxTextArea({ placeholder: 'Açık adres giriniz', isValid: false, maxLength: 200, height: 100 }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextArea('instance');
var pe8 = $("#p-e-8").dxTextBox({ placeholder: 'Email giriniz', isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var pe9 = $("#p-e-9").dxTextBox({ placeholder: 'Telefon numarası giriniz', isValid: false, mask: '(000) 000 - 0000', readOnly: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
$.ajax({
    url: "../../Main/Regions_GET",
    success: function (data) {
        var regions = JSON.parse(data);
        $("#p-e-6").dxTagBox({
            items: regions,
            valueExpr: 'Id',
            displayExpr: 'Bolge'
        });
    }
});

var emp = [];

topMenuItems = [
       {
           icon: "fa fa-user-plus",
           caption: "Personel Ekle",
           onclick: function () {
               $("#mdl-pe").modal('show');

           }
       },
       {
           icon: "fa fa-trash-o",
           caption: "Personel Sil",
           onclick: function () {
               if ($("#employeegrid").dxDataGrid("instance").getSelectedRowsData().length == 0) {
                   swal({ title: "Silme işlemi için lütfen personel seçiniz", type: "warning", timer: 1000, showConfirmButton: false });
               }
               else {
                   emp = [];
                   emp = $("#employeegrid").dxDataGrid("instance").getSelectedRowsData();
                   console.log(emp);
                   swal({ title: "Silmek istediğinize emin misiniz?", text: "Seçtiğiniz personel silinecektir, geri dönüşü mümkün değildir!", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "Onaylıyorum!", cancelButtonText: "Onaylamıyorum!", closeOnConfirm: false, closeOnCancel: false }, function (isConfirm) {
                       if (isConfirm) {
                           swal({ title: "Silindi!", text: "Personel başarı ile silindi.", timer: 1000, showConfirmButton: false });
                           $.ajax({
                               url: "../../Main/Employee_DELETE",
                               data: {
                                   Id: emp[0].Id
                               },
                               success: function (e) {
                                   griddata();
                               }
                           });
                       }
                       else { swal({ title: "İptal Edildi", text: "Personel kaydınız silinmedi ", timer: 1000, showConfirmButton: false }); return; }
                   })
               }
           }
       }]
$(document).ready(function () {
    griddata();
});

function griddata() {
    $.ajax({
        url: "../../Main/Employees_GET",
        success: function (data) {
            employees = JSON.parse(data);
            $("#employeegrid").dxDataGrid("instance").option({
                dataSource: employees,
            }).refresh();
        }
    });
}

$("#employeegrid").dxDataGrid({
    dataSource: employees,
    selection: {
        mode: 'single'
    },
    hoverStateEnabled: true,
    columns: [
        {
            dataField: 'Fotograf',
            width: 80,
            allowSorting: false,
            allowFiltering: false,
            caption: 'Fotograf',
            cellTemplate: function (container, options) {
                container.height(57);
                $('<img/>')
                .height(64)
                .attr('src', options.value)
                .addClass('imgPersonel')
                .appendTo(container);
            }

        },
        {
            dataField: 'Ad',
            caption: 'Ad'
        },
        {
            dataField: 'Soyad',
            caption: 'Soyad'
        },
        {
            dataField: 'Email',
            caption: 'Email',
        },
        {
            dataField: 'AracPlaka',
            caption: 'Araç Plakası'
        },
        {
            dataField: 'BolgeAdlari',
            caption: 'Bolge'
        },
    ],
    searchPanel: {
        visible: true,
        width: 240,
        placeholder: 'Ara...'
    },
    onRowClick: function (e) {
        var component = e.component,
          prevClickTime = component.lastClickTime;
        component.lastClickTime = new Date();
        if (prevClickTime && (component.lastClickTime - prevClickTime < 250)) {
            window.location.href = '../../Main/Employee?Id=' + e.key.Id;
        }
    },
    groupPanel: {
        visible: true
    },
    showBorders: true,
    headerFilter: {
        visible: true
    },
    filterRow: {
        visible: true,
        applyFilter: "auto"
    }
});


$(document).on("click", "#p-kaydet", function () {
    if (checkallvalid([pe2, pe3, pe4, pe5, pe6, pe7, pe8, pe9])) {
        if (pe4.option('value') == pe10.option('value')) {
            var bolge = pe6.option("values");
            var k = bolge.toString();
            var personeldata = new FormData();
            var image = $("#p-e-1").oUploader("instance").getFiles();
            personeldata.append("Resim", image[0]);
            personeldata.append("Ad", pe2.option("value"));
            personeldata.append("Soyad", pe3.option("value"));
            personeldata.append("Sifre", pe4.option("value"));
            personeldata.append("AracPlaka", pe5.option("value"));
            personeldata.append("Bolge", k);
            personeldata.append("Adres", pe7.option("value"));
            personeldata.append("Email", pe8.option("value"));
            personeldata.append("TelefonNo", pe9.option("value"));
            console.log(personeldata);
            $.ajax({
                url: "../../Main/Employee_SET",
                type: "POST",
                data: personeldata,
                cache: false,
                processData: false,
                contentType: false,
                success: function () {
                    pe2.reset();
                    pe3.reset();
                    pe4.reset();
                    pe5.reset();
                    pe6.reset();
                    pe7.reset();
                    pe8.reset();
                    pe9.reset();
                    pe10.reset();
                    $("#mdl-pe").modal("toggle");
                    griddata();
                }
            });
        }
        else {
            swal({ title: "Şifreler birbiri ile uyuşmuyor", type: "error", timer: 1000, showConfirmButton: false });
        }
    }
    else {
        swal("Lütfen formu eksiksiz doldurunuz!!", "", "error");
    }

});

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



$("#p-e-1").oUploader("instance").destroy();
$("#p-e-1").oUploader({
    maxSize: 2048,
    allowMultiple: false,
    trigger: "manual",
    customFileTypes: "image/*"
});


$(document).on("hidden.bs.modal", "#mdl-pe", function (e) {
    $("#p-e-1").oUploader("instance").destroy();
    temizle("#mdl-pe");
});

$(document).on("show.bs.modal", "#mdl-pe", function () {
    var pe1 = $("#p-e-1").oUploader({
        maxSize: 2048,
        allowMultiple: false,
        trigger: "manual",
        customFileTypes: "image/*"
    });
});
function temizle(a) {
    var ss = a.find(".dx-widget");
    for (var i = 0; i < ss.length; i++) {
        var dd = $(ss[i]).data();
        if (dd.dxComponents != undefined) {
            switch (dd.dxComponents[0]) {
                case "dxTagBox": $(ss[i]).dxTagBox("instance").reset(); break;
                case "dxTextArea": $(ss[i]).dxTextArea("instance").reset(); break;
                case "dxSelectBox": $(ss[i]).dxSelectBox("instance").reset(); break;
                case "dxNumberBox": $(ss[i]).dxNumberBox("instance").option("value", 1); break;
                case "dxTextBox": $(ss[i]).dxTextBox("instance").reset(); break;
            }
        }
    }
}