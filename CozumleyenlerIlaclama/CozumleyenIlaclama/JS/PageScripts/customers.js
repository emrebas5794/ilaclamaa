///<reference path="../../Scripts/jquery-2.1.4.js" />
/// <reference path="../../External/dx.all.js" />


//MÜŞTERİ EKLEME DEĞİŞKENLERİ
var mt1 = $("#m-t-1").dxTextBox({ placeholder: 'Firma adını giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { mt1.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var mt2 = $("#m-t-2").dxSelectBox({ fieldEditEnabled: false, placeholder: 'Sektör seçiniz', isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxSelectBox('instance');
var mt3 = $("#m-t-3").dxSelectBox({ placeholder: 'Firma tipini seçiniz', isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxSelectBox('instance');
var mt5 = $("#m-t-5").dxSelectBox({ placeholder: 'İl seçiniz', isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxSelectBox('instance');
var mt6 = $("#m-t-6").dxTextBox({ placeholder: 'İlçe giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { mt6.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var mt7 = $("#m-t-7").dxTextArea({ placeholder: 'Açık adres giriniz', maxLength: 200, height: 100, isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextArea('instance');
var mt8 = $("#m-t-8").dxTextBox({ placeholder: 'Email adresi giriniz', isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var mt9 = $("#m-t-9").dxTextBox({ placeholder: 'Telefon numarası giriniz', isValid: false, mask: '(000) 000 - 0000' }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var mt4 = $("#m-t-4").dxSelectBox({ placeholder: 'Firma türünü seçiniz', isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxSelectBox('instance');
var mt10 = $("#m-t-10").dxSelectBox({
    placeholder: 'Durum seçiniz',
    isValid: true,
}).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alanı seçmek zorundasınız !' }] }).dxSelectBox('instance');
var mt11 = $("#m-t-11").dxTextBox({ placeholder: 'Firma ünvanı giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { mt11.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var mt12 = $("#m-t-12").dxTagBox({ placeholder: 'Hizmet türü seçiniz', isValid: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alanı seçmek zorundasınız !' }] }).dxTagBox("instance");
$.ajax({
    url: "../../Main/Services_GET",
    type: "post",
    success: function (data) {
        var b = JSON.parse(data);
        $("#m-t-12").dxTagBox({
            dataSource: b,
            valueExpr: "Id",
            displayExpr: "HizmetAdi",
            searchEnabled: true,
        });
    }
});
var firmaTur;
topMenuItems = [
       {
           icon: "fa fa-user-plus",
           caption: "Müşteri Ekle",
           onclick: function () {
               $('#mdl-me').modal('show')
           }
       },
       {
           icon: "fa fa-trash-o",
           caption: "Sil",
           onclick: function () {
               if ($("#grid").dxDataGrid("instance").getSelectedRowsData().length == 0) {
                   swal({ title: "Silme işlemi için lütfen müşteri seçiniz", type: "warning", timer: 1000, showConfirmButton: false });
               }
               else {
                   arr = [];
                   arr = $("#grid").dxDataGrid("instance").getSelectedRowsData();
                   swal({ title: "Silmek istediğinize emin misiniz?", text: "Seçtiğiniz müşteri silinecektir, geri dönüşü mümkün değildir!", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "Onaylıyorum!", cancelButtonText: "Onaylamıyorum!", closeOnConfirm: false, closeOnCancel: false }, function (isConfirm) {
                       if (isConfirm) {
                           swal({ title: "Silindi!", text: "Müşteri başarı ile silindi.", timer: 1000, showConfirmButton: false });
                           $.ajax({
                               url: "../../Main/Customer_DELETE",
                               data: {
                                   Id: arr[0].Id
                               },
                               success: function (e) {
                                   if (e == "1") {
                                       griddata(1);
                                   }
                                   else {
                                       console.log(e);
                                   }
                               }
                           });
                       }
                       else { swal({ title: "İptal Edildi", text: "Müşteri kaydınız silinmedi ", timer: 1000, showConfirmButton: false }); return; }
                   })
               }
           }
       }];

$(document).ready(function () {
    griddata(0);
    get_sektor();
    get_il();
    get_firmatur();
    get_firmatip();
    get_durum();
});

//SEKTÖR ÇEKİLMESİ
function get_sektor() {
    $.ajax({
        url: "../../Main/Sector_GET_DATA",
        success: function (data) {
            var result = JSON.parse(data);
            $("#m-t-2").dxSelectBox({
                items: result,
                valueExpr: 'Id',
                displayExpr: 'Sektor',

            });
        }
    });
}

function get_il() {
    $.ajax({
        url: "../../Main/City_GET_DATA",
        success: function (data) {
            var result = JSON.parse(data);
            $("#m-t-5").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'Il',

            });
        }
    });
}
//kurumsal  bireysel
function get_firmatur() {
    $.ajax({
        url: "../../Main/CustomerType_GET_DATA",
        success: function (data) {
            var result = JSON.parse(data);
            $("#m-t-4").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'FirmaTur',

            });
        }
    });
}
//ev konut
function get_firmatip() {
    $.ajax({
        url: "../../Main/CustomerKind_GET_DATA",
        success: function (data) {
            var result = JSON.parse(data);
            $("#m-t-3").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'FirmaTip',
            });
        }
    });
}

function get_durum() {
    $.ajax({
        url: "../../Main/Situation_GET_DATA",
        success: function (data) {
            var result = JSON.parse(data);
            $("#m-t-10").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'Durum',
                value: result[0].Id
            });
        }
    });
}
//MÜŞTERİLERİN ÇEKİLMESİ
function griddata(e) {
    $.ajax({
        url: "../../Main/Customer_GET_DATA",
        error: function (jqxhr) {
            console.log(jqxhr);
        },
        success: function (data) {
            var a = JSON.parse(data);
            gridkontrol(a, e);
        }
    });
}
//BİTİŞ
function gridkontrol(a, e) {
    if (e == 1) {
        $("#grid").dxDataGrid("instance").option({
            dataSource: a,
        }).refresh();
        return;
    }

    $("#grid").dxDataGrid({
        dataSource: a,
        selection: {
            mode: 'single'
        },
        hoverStateEnabled: true,
        columns: [
            {
                dataField: 'Ad',
                caption: 'Firma Adı'
            },
            {
                dataField: 'FaturaUnvani',
                caption: 'Firma Ünvanı'
            },
            {
                dataField: 'Hizmet',
                caption: 'Hizmetler'
            },
            {
                dataField: 'Sektor',
                caption: 'Sektör'
            },
            {
                dataField: 'FirmaTur',
                caption: 'Firma Türü',
            },
            {
                dataField: 'FirmaTip',
                caption: 'Firma Tipi'
            },
            {
                dataField: 'Il',
                caption: 'İl'
            },
            {
                dataField: 'Ilce',
                caption: 'İlçe'
            },
            {
                dataField: 'Durum',
                caption: 'Durum'
            }],
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
                window.location.href = '../../Main/Customer?Id=' + e.key.Id;
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
        //onCellPrepared: function (e) {
        //    if (e.rowType=="data") {
        //        if (e.column.dataField == "Ad" || e.column.dataField == "FirmaTur" || e.column.dataField == "FirmaTip" || e.column.dataField == "Sektor" || e.column.dataField == "Il" || e.column.dataField == "Ilce" || e.column.dataField == "Aktif") {
        //            e.cellElement[0].innerHTML = e.value.replace(/i/g, "İ").toUpperCase();
        //        } 

        //    }
        //}
    });
}

//MÜŞTERİ EKLENMESİ
$(document).on("click", "#m-kaydet", function () {
    if (checkallvalid([mt1, mt2, mt3, mt4, mt5, mt6, mt7, mt8, mt9, mt10, mt11, mt12])) {
        var hizmet = mt12.option("values").toString();
        $.ajax({
            url: "../../Main/Customer_SET_DATA",
            type: 'POST',
            data: {
                Ad: mt1.option('value'),
                FaturaUnvani: mt11.option('value'),
                HizmetAdi: hizmet,
                TelNo: mt9.option('value'),
                Email: mt8.option('value'),
                Il: mt5.option('value'),
                Ilce: mt6.option('value'),
                Adres: mt7.option('value'),
                FirmaTip: mt3.option('value'),
                Sektor: mt2.option('value'),
                Aktif: mt10.option('value'),
                FirmaTur: mt4.option('value'),
            },

            success: function (e) {
                if (e == "1") {
                    griddata(1);
                    $('#mdl-me').modal('toggle');
                    swal({ title: "Müşteri başarı ile eklendi", type: "success", timer: 1000, showConfirmButton: false });
                }
                else {
                    console.log(e);
                }
            }
        });
    }
    else {
        swal("Lütfen formu eksiksiz doldurunuz!!", "", "error");
    }
});  //BİTİŞ

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
$(document).on("hidden.bs.modal", "#mdl-me", function (e) {
    temizle($("#mdl-me"));
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