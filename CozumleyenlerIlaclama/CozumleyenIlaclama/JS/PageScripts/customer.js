/// <reference path="../../Scripts/jquery-2.1.4.js" />

var _yetkililer;
var duzenlemeaktif = false;
var mg1 = $("#m-g-1").dxTextBox({ placeholder: 'Firma adını giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { mg1.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false, readOnly: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var mg2 = $("#m-g-2").dxSelectBox({ placeholder: 'Sektör seçiniz', isValid: false, readOnly: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxSelectBox('instance');
var mg3 = $("#m-g-3").dxSelectBox({ placeholder: 'Firma tipi seçiniz', isValid: false, readOnly: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxSelectBox('instance');
var mg4 = $("#m-g-4").dxSelectBox({ placeholder: 'Firma türü seçiniz', isValid: false, readOnly: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxSelectBox('instance');
var mg5 = $("#m-g-5").dxSelectBox({ placeholder: 'İl şeciniz', isValid: false, readOnly: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxSelectBox('instance');
var mg6 = $("#m-g-6").dxTextBox({ placeholder: 'İlçe giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { mg6.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false, readOnly: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var mg7 = $("#m-g-7").dxTextBox({ placeholder: 'Adres giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { mg7.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false, readOnly: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var mg8 = $("#m-g-8").dxTextBox({ placeholder: 'Email adresi giriniz', isValid: false, readOnly: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var mg9 = $("#m-g-9").dxTextBox({ placeholder: 'Telefon numarası giriniz', isValid: false, readOnly: true, mask: '(000) 000 - 0000' }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var mg10 = $("#m-g-10").dxSelectBox({
    placeholder: 'Durum seçiniz',
    readOnly: true,
}).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alanı seçmek zorundasınız !' }] }).dxSelectBox('instance');

var mg11 = $("#m-g-11").dxTextBox({ placeholder: 'Fatura  ünvanı giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { mg11.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false, readOnly: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');

var mg12 = $("#m-g-12").dxTagBox({ placeholder: 'Hizmet seçiniz', isValid: true, readOnly: true }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alanı seçmek zorundasınız !' }] }).dxTagBox("instance");
$.ajax({
    url: "../../Main/Services_GET",
    type: "post",
    success: function (data) {
        var b = JSON.parse(data);
        $("#m-g-12").dxTagBox({
            dataSource: b,
            valueExpr: "Id",
            displayExpr: "HizmetAdi",
            searchEnabled: true
        });
    }
});


//YETKİLİ ATAMA DEĞİŞKENLERİ
var mya1 = $("#y-a-1").dxTextBox({ placeholder: 'Ad giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { mya1.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var mya2 = $("#y-a-2").dxTextBox({ placeholder: 'Soyad giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { mya2.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var mya3 = $("#y-a-3").dxTextBox({ placeholder: 'Unvan giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { mya3.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var mya4 = $("#y-a-4").dxTextBox({ placeholder: 'Telefon numarası giriniz', isValid: false, mask: '(000) 000 - 0000' }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var mya5 = $("#y-a-5").dxTextBox({ placeholder: 'Email adresi giriniz', isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');


var myg1 = $("#y-g-1").dxTextBox({ placeholder: 'Ad giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { myg1.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var myg2 = $("#y-g-2").dxTextBox({ placeholder: 'Soyad giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { myg2.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var myg3 = $("#y-g-3").dxTextBox({ placeholder: 'Unvan giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { myg3.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var myg4 = $("#y-g-4").dxTextBox({ placeholder: 'Telefon numarası giriniz', isValid: false, mask: '(000) 000 - 0000' }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');
var myg5 = $("#y-g-5").dxTextBox({ placeholder: 'Email adresi giriniz', isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTextBox('instance');

//HİZMET SÖZLEŞMESİ
var hs1 = $("#h-s-1").dxNumberBox({ min: 1, max: 10, showSpinButtons: true, value: 1 }).dxNumberBox("instance");
var hs6 = $("#h-s-6").dxTagBox({ placeholder: 'Hizmetler' }).dxTagBox("instance");

var esp1 = $("#e-s-p1").dxTagBox({ placeholder: 'Hizmet seçiniz', isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxTagBox("instance");
var esp2 = $("#e-s-p2").dxSelectBox({ placeholder: 'Personel seçiniz', isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxSelectBox('instance');
var esp3 = $("#e-s-p3").dxDateBox({ format: "datetime", isValid: false }).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxDateBox("instance");
var esp5 = $("#e-s-p5").dxTextBox({ placeholder: "Açıklama giriniz" }).dxTextBox("instance");

var it1 = $("#i-t-1").dxTagBox({ placeholder: "İstasyon seçiniz" }).dxTagBox("instance");
var it2 = $("#i-t-2").dxNumberBox({ min: 1, max: 10, showSpinButtons: true, value: 1 }).dxNumberBox("instance");

var istg1 = $("#ist-g-1").dxSelectBox({ placeholder: 'Personel seçiniz' }).dxSelectBox("instance");
var istg2 = $("#ist-g-2").dxDateBox({ format: 'date' }).dxDateBox("instance");
var istg3 = $("#ist-g-3").dxTextBox({ placeholder: "Yer bilgisi giriniz" }).dxTextBox("instance");
var istg4 = $("#ist-g-4").dxTextBox({ placeholder: "Açıklama giriniz" }).dxTextBox("instance");

var Aktivite = ["TELEFON İLE GÖRÜŞÜLDÜ", "SMS GÖNDERİLDİ", "E-POSTA GÖNDERİLDİ", "YÜZYÜZE GÖRÜŞÜLDÜ", "SÖZLEŞME YAPILDI", "DAHA SONRA GÖRÜŞÜLECEK", "RANDEVU ALINDI", "ULAŞILAMADI"];
var AktiviteSonucu = ["OLUMSUZ", "%20 OLUMLU", "%50 OLUMLU", "%90 OLUMLU", "%100 OLUMLU"]
var akte1 = $("#akt-e-1").dxSelectBox({
    placeholder: 'Aktivite seçiniz', dataSource: Aktivite, isValid: false
}).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxSelectBox('instance');
var akte2 = $("#akt-e-2").dxSelectBox({ placeholder: 'Müşteri yetkilisi seçiniz' }).dxSelectBox("instance");
var akte3 = $("#akt-e-3").dxTextArea({ height: 70 }).dxTextArea("instance");
var akte4 = $("#akt-e-4").dxSelectBox({
    placeholder: 'Aktivite sonucu seçiniz', dataSource: AktiviteSonucu, isValid: false
}).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxSelectBox('instance');
var sonuc = ["Evet", "Hayır"]
var akte5 = $("#akt-e-5").dxRadioGroup({
    layout: "horizontal",
    items: sonuc,
    value: sonuc[1],
    onValueChanged: function (e) {
        if (e.value == "Hayır") {
            $("#hatirlatmadiv").css("display", "none");
        }
        else {
            $("#hatirlatmadiv").css("display", "block");
        }
    }
});
var akte6 = $("#akt-e-6").dxTextBox({ placeholder: 'Hatırlatma Mesajı' }).dxTextBox("instance");
var akte7 = $("#akt-e-7").dxDateBox({ format: "datetime" }).dxDateBox("instance");

var aktg1 = $("#akt-g-1").dxSelectBox({
    placeholder: 'Aktivite seçiniz', dataSource: Aktivite, isValid: false, readOnly: true,
}).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxSelectBox('instance');
var aktg2 = $("#akt-g-2").dxSelectBox({ placeholder: 'Müşteri yetkilisi seçiniz', readOnly: true, }).dxSelectBox("instance");
var aktg3 = $("#akt-g-3").dxTextArea({ height: 70, readOnly: true, }).dxTextArea("instance");
var aktg4 = $("#akt-g-4").dxSelectBox({
    placeholder: 'Aktivite sonucu seçiniz', dataSource: AktiviteSonucu, isValid: false, readOnly: true,
}).dxValidator({ validationRules: [{ type: 'required', message: 'Bu alan boş bırakılamaz !' }] }).dxSelectBox('instance');
var aktg5 = $("#akt-g-5").dxRadioGroup({
    layout: "horizontal",
    readOnly: true,
    items: sonuc,
    value: sonuc[1],
    onValueChanged: function (e) {
        if (e.value == "Hayır") {
            $("#hatirlatmagordiv").css("display", "none");
        }
        else {
            $("#hatirlatmagordiv").css("display", "block");
        }
    }
}).dxRadioGroup("instance");
var aktg6 = $("#akt-g-6").dxTextBox({ placeholder: 'Hatırlatma Mesajı', readOnly: true, }).dxTextBox("instance");
var aktg7 = $("#akt-g-7").dxDateBox({ format: "datetime" }).dxDateBox("instance");



var istasyonumara = "";
$.ajax({
    url: "../../Main/Station_GET",
    type: "post",
    success: function (data) {
        var datas = JSON.parse(data);
        $("#i-t-1").dxTagBox({
            dataSource: datas,
            displayExpr: "Ad",
            valueExpr: "Id"
        });
        $("#ist-g-1").dxSelectBox({
            dataSource: datas,
            displayExpr: "Ad",
            valueExpr: "Id",
        });
    }
});

$.ajax({
    url: "../../Main/Services_GET",
    type: "post",
    success: function (data) {
        var b = JSON.parse(data);
        $("#h-s-6").dxTagBox({
            dataSource: b,
            valueExpr: "Id",
            displayExpr: "HizmetAdi",
            searchEnabled: true
        });
        $("#e-s-p1").dxTagBox({
            dataSource: b,
            valueExpr: "Id",
            displayExpr: "HizmetAdi",
            searchEnabled: true
        });
    }
});

$.ajax({
    url: "../../Main/SozlesmeEmployee",
    success: function (data) {
        var c = JSON.parse(data);
        var calisanlar = [];
        var calisan = {};
        for (var i = 0; i < c.length; i++) {
            calisan = {
                AdSoyad: c[i].Ad + " " + c[i].Soyad,
                Id: c[i].Id
            }
            calisanlar.push(calisan);
        }
        $("#e-s-p2").dxSelectBox({
            dataSource: calisanlar,
            valueExpr: "Id",
            displayExpr: "AdSoyad",
        });
    }
});

$.ajax({
    url: "../../Main/StationCustomerNumber",
    data: {
        MusteriId: customer[0].Id
    },
    success: function (number) {
        istasyonumara = number;
    }
});



var arr = [];
var yetkili;
var musteriaktivitelist;
topMenuItems = [
       {
           icon: "fa fa-pencil-square-o",
           caption: "Düzenlemeyi Etkinleştir",
           onclick: function () {
               $(this).children(".t-caption").toggleText("Düzenlemeyi Etkinleştir", "Düzenlemeyi Bitir")
               if ($(this).children(".t-caption").text() == "Düzenlemeyi Etkinleştir") {
                   ReadOnlyYap($("#readOnlySelector"), "true");
                   $("#m-guncelle").css("display", "none");
                   $("#m-iptal").css("display", "none");
                   $(".btn-yg").css("display", "none");
                   $(".btn-ys").css("display", "none");
                   $(".btn-mag").css("display", "none");
                   $(".btn-mas").css("display", "none");
                   duzenlemeaktif = false;
                   $("#m-iptal").click();

               }
               else if ($(this).children(".t-caption").text() == "Düzenlemeyi Bitir") {
                   ReadOnlyYap($("#readOnlySelector"), "false");
                   $("#m-guncelle").css("display", "block");
                   $("#m-iptal").css("display", "block");
                   $(".btn-yg").css("display", "block");
                   $(".btn-ys").css("display", "block");
                   $(".btn-mag").css("display", "block");
                   $(".btn-mas").css("display", "block");
                   duzenlemeaktif = true;
               }
           }
       },
       {
           icon: "fa fa-user-plus",
           caption: "Müşteriye Yetkili Ata",
           onclick: function () {
               if (customer[0].Id == null) {
                   swal({ title: "Yetkili atamak için lütfen müşteri seçiniz", type: "warning", timer: 1000, showConfirmButton: false });
               }
               else {
                   $("#mdl-mya").modal('show');
               }
           }
       },
       {
           icon: "fa fa-file",
           caption: "Hizmet Sözleşmesi Düzenle",
           onclick: function () {
               $("#mdl-hsd").modal("show");
           }
       },
       {
           icon: "fa fa-thumb-tack",
           caption: "Ek Servis Planlama",
           onclick: function () {
               $("#mdl-esp").modal("show");
           }

       },
         {
             icon: "fa fa-map-marker",
             caption: "İstasyon Tanımla",
             onclick: function () {
                 $("#mdl-istTanimla").modal("show");
             }
         },
       {
           icon: "fa fa-list",
           caption: "İstasyonları Gör",
           onclick: function () {
               $("#mdl-IstListele").modal("show");
           }
       },
      {
          icon: "fa fa-shield",
          caption: "Aktivite Yönetimi",
          onclick: function () {
              $("#mdl-AktiviteYonetimi").modal("show");
          }

      }]

$(document).ready(function () {

    var def1 = $.Deferred();
    var def2 = $.Deferred();
    var def3 = $.Deferred();
    var def4 = $.Deferred();
    var def5 = $.Deferred();

    $.ajax({
        url: "../../Main/Sector_GET_DATA",
        success: function (data) {
            var result = JSON.parse(data);
            $("#m-g-2").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'Sektor'
            });
            def1.resolve(result);
        }
    });

    $.ajax({
        url: "../../Main/City_GET_DATA",
        success: function (data) {
            var result = JSON.parse(data);
            $("#m-g-5").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'Il'
            });
            def2.resolve(result);
        }
    });

    $.ajax({
        url: "../../Main/CustomerType_GET_DATA",
        success: function (data) {
            var result = JSON.parse(data);
            $("#m-g-4").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'FirmaTur'
            });
            def3.resolve(result);
        }
    });

    $.ajax({
        url: "../../Main/CustomerKind_GET_DATA",
        success: function (data) {
            var result = JSON.parse(data);
            $("#m-g-3").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'FirmaTip'
            });
            def4.resolve(result);
        }
    });

    $.ajax({
        url: "../../Main/Situation_GET_DATA",
        success: function (data) {
            var result = JSON.parse(data);
            $("#m-g-10").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'Durum'
            });
            def5.resolve(result);
        }
    });

    $.when(def1, def2, def3, def4, def5).done(function (ev1, ev2, ev3, ev4, ev5) {
        mg1.option('value', customer[0].Ad);
        mg11.option('value', customer[0].FaturaUnvani);
        mg12.option('values', customer[0].HizmetId.split(","));
        mg2.option('value', customer[0].SektorId);
        mg3.option('value', customer[0].FirmaTipId);
        mg4.option('value', customer[0].FirmaTurId);
        mg5.option('value', customer[0].IlId);
        mg6.option('value', customer[0].Ilce);
        mg7.option('value', customer[0].Adres);
        mg8.option('value', customer[0].Email);
        var Tel = $.trim(customer[0].TelNo)
        mg9.option('value', Tel);
        mg10.option('value', customer[0].DurumId);
        yetkili_GET_DATA();
        aktivite_GET_DATA();
        istasyonListele();
        $("#m-t-l").css("display", "none");
        $("#m-a-l").css("display", "none");
    });
});

function yetkili_GET_DATA() {
    $.ajax({
        url: "../../Main/Authorized_GET_DATA",
        data: { CustomerId: customer[0].Id },
        success: function (DATA) {
            var result = JSON.parse(DATA);
            $("#m-t-l").dxList({
                items: result,
                noDataText: 'Yetkili yok',
                onItemClick: function (rowData) {
                    yetkili = rowData.itemData;
                },
                itemTemplate: function (data, index) {
                    var durum = "none"
                    if (duzenlemeaktif == true) {
                        durum = "block"
                    }
                    var result = $('<div>').data(data);
                    var r1 = $('<div>').addClass().html(data.AdSoyad);
                    var r4 = $('<button>').addClass("btn btn-primary btn-yg").html("Düzenle").css("display", durum).attr('id', data.Id);
                    var r2 = $('<div>').addClass().html("Ünvan : " + data.Unvan);
                    var r3 = $('<div>').addClass().html("Gsm : " + data.Telefon + '&nbsp' + "Email : " + data.Email);
                    var r5 = $('<button>').addClass("btn btn-danger btn-ys").html("Sil").css("display", durum).attr('id', data.Id);

                    result.append(r1).append(r4).append(r2).append(r3).append(r5);
                    return result;
                }
            });
            $("#akt-e-2").dxSelectBox({
                dataSource: result,
                valueExpr: "Id",
                displayExpr: "AdSoyad"
            });
            $("#akt-g-2").dxSelectBox({
                dataSource: result,
                valueExpr: "Id",
                displayExpr: "AdSoyad"
            });
        }
    });
}

function aktivite_GET_DATA() {
    $.ajax({
        url: "../../Main/CustomerActivity_GET",
        data: { id: customer[0].Id },
        success: function (DATA) {
            var result = JSON.parse(DATA);
            $("#m-a-l").dxList({
                items: result,
                noDataText: 'Aktivite yok',
                onItemClick: function (rowData) {
                    musteriaktivitelist = rowData.itemData;
                },
                itemTemplate: function (data, index) {
                    var durum = "none"
                    if (duzenlemeaktif == true) {
                        durum = "block"
                    }
                    var result = $('<div>').data(data);
                    var r1 = $('<div>').addClass().html(data.Aktivite);
                    var r4 = $('<button>').addClass("btn btn-primary btn-mag").html("Detay").css("display", durum).attr('id', data.Id);
                    var r2 = $('<div>').addClass().html("Aktivite Sonucu : " + data.AktiviteSonucu);
                    var r3 = $('<div>').addClass().html("Tarih : " + data.Tarih);
                    var r5 = $('<button>').addClass("btn btn-danger btn-mas").html("Sil").css("display", durum).attr('id', data.Id);

                    result.append(r1).append(r4).append(r2).append(r3).append(r5);
                    return result;

                }
            });
        }
    })
}

function istasyonListele() {
    $.ajax({
        url: "../../Main/StationCustomer_GET",
        data: { MusteriId: customer[0].Id },
        success: function (DATA) {
            var result = JSON.parse(DATA);
            $("#istasyonlist").dxList({
                items: result,
                noDataText: 'Bu müşterinin istasyonu yok',
                onItemClick: function (rowData) {
                    yetkili = rowData.itemData;
                },
                itemTemplate: function (data, index) {
                    var tar = data.Tarih;
                    var t = tar.split(" ");
                    var aciklama = data.Aciklama;
                    var ack = aciklama.substring(0, 72) + "...";

                    var istList = $('<div>').data(data),
                     r1 = $('<div>').addClass("col-xs-1 num").html(data.Numara),
                     divide = $('<hr>').addClass("vertical"),
                     r2 = $('<div>').addClass("ad").html(data.Ad),
                     r4 = $('<div>').addClass("tarih").html(data.Tarih),
                     divide2 = $('<hr>').addClass("vertical"),
                     r3 = $('<div>').addClass("yer").html(data.Yer),
                     divide3 = $('<hr>').addClass("horizantal"),
                     r24 = $("<div>").addClass("kapsayan").append(r2, r4),
                     r5 = $('<div>').html(ack),
                     r6=$('<abbr>').attr('title', data.Aciklama).append(r5),
                     r35 = $('<div>').addClass("kapsayan2").append(r3, r6),
                     divide4 = $('<hr>').addClass("vertical2"),
                     btnGuncelle = $('<button>').addClass("btn btn-primary gIst").html("Güncelle").attr('id', data.Id)
                    alt = $('<br/>');
                    btnSil = $('<button>').addClass("btn btn-danger sIst").html("Sil").attr('id', data.Id),
                     btnKapsayan = $('<div>').addClass("IstbtnKapsayan").append(btnGuncelle, alt, btnSil);
                    istList.append(r1).append(divide).append(r24).append(divide2).append(r35).append(divide4).append(btnKapsayan);
                    return istList;
                    //var istList = $('<div>').data(data),
                    // r1 = $('<div>').addClass("col-xs-1 num").html(data.Numara),
                    // divide = $('<hr>').addClass("vertical"),
                    // r2 = $('<div>').addClass("ad").html(data.Ad),
                    // r4 = $('<div>').addClass("tarih").html(t[0]),
                    // divide2 = $('<hr>').addClass("vertical"),
                    // r3 = $('<div>').addClass("yer").html(data.Yer),
                    // //divide3 = $('<hr>').addClass("horizantal"),
                    // r24 = $("<div>").addClass("kapsayan").append(r2, r4),
                    // r5 = $('<div>').html(ack).addClass("aciklama"),
                    // r6 = $('<abbr>').attr('title', data.Aciklama).append(r5),

                    // r35 = $('<div>').addClass("kapsayan2").append(r3, r6),
                    // divide4 = $('<hr>').addClass("vertical2"),
                    // btnGuncelle = $('<button>').addClass("btn btn-primary gIst").html("Güncelle").attr('id', data.Id)
                    //alt = $('<br/>');
                    //btnSil = $('<button>').addClass("btn btn-danger sIst").html("Sil").attr('id', data.Id),
                    // btnKapsayan = $('<div>').addClass("IstbtnKapsayan").append(btnGuncelle, alt, btnSil);
                    //istList.append(r1).append(divide).append(r24).append(divide2).append(r35).append(divide4).append(btnKapsayan);
                    //return istList;
                }
            });
        }
    })
}
var ist = [];
//MÜŞTERİ İSTASYON GÜNCELLEME İŞLEMİ
$(document).on("click", ".gIst", function () {
    ist = DevExpress.data.query($("#istasyonlist").dxList('instance').option('items')).filter([["Id", "=", $(this).attr('id')]]).toArray();
    istg1.option("value", ist[0].IstasyonId);
    istg2.option("value", moment(ist[0].HatirlatmaTarihi, "DD.MM.YYYY").toDate());
    istg3.option("value", ist[0].Yer);
    istg4.option("value", ist[0].Aciklama);
    $("#mdl-IstGuncelle").modal("show");


});
//MÜŞTERİ İSTASYON GÜNCELLEME KAYDET
$(document).on("click", "#IstKaydet", function () {
    $.ajax({
        url: "../../Main/StationCustomer_UPDATE",
        data: {
            Id: ist[0].Id,
            IstasyonId: istg1.option("value"),
            Tarih: moment(istg2.option("value")).format("YYYY-MM-DD"),
            Yer: istg3.option("value"),
            Aciklama: istg4.option("value")
        },
        success: function () {
            istasyonListele();
            $("#mdl-IstGuncelle").modal("hide");
        }
    });
});
//MÜŞTERİ İSTASYON SİL
$(document).on("click", ".sIst", function () {
    ist = DevExpress.data.query($("#istasyonlist").dxList('instance').option('items')).filter([["Id", "=", $(this).attr('id')]]).toArray();
    swal({ title: "Silmek istediğinize emin misiniz?", text: "Seçtiğiniz istasyonun müşteriden silinecektir, geri dönüşü mümkün değildir!", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "Onaylıyorum!", cancelButtonText: "Onaylamıyorum!", closeOnConfirm: false, closeOnCancel: false }, function (isConfirm) {
        if (isConfirm) {
            swal({ title: "Silindi!", text: "İstasyon başarı ile silindi.", timer: 1000, showConfirmButton: false });
            $.ajax({
                url: "../../Main/StationCustomer_DELETE",
                data: {
                    Id: ist[0].Id
                },
                success: function () {
                    istasyonListele();
                }
            });
        }
        else { swal({ title: "İşlem iptal Edildi", text: "İstasyon kaydınız silinmedi ", timer: 1000, showConfirmButton: false }); return; }
    });
});
//MÜŞTERİ GÜNCELLEME İŞLEMİNİ KAYDEDEN BUTON
$(document).on("click", "#m-guncelle", function () {
    if (checkallvalid([mg1, mg2, mg3, mg4, mg5, mg6, mg7, mg8, mg9, mg10, mg11, mg12])) {
        $.ajax({
            url: "../../Main/Customer_UPDATE_DATA",
            data: {
                Id: customer[0].Id,
                Ad: mg1.option('value'),
                FaturaUnvani: mg11.option('value'),
                Hizmet: mg12.option('values').toString(),
                Sektor: mg2.option('value'),
                FirmaTip: mg3.option('value'),
                FirmaTur: mg4.option('value'),
                Il: mg5.option('value'),
                Ilce: mg6.option('value'),
                Adres: mg7.option('value'),
                Email: mg8.option('value'),
                Telefon: mg9.option('value'),
                Durum: mg10.option('value'),
            },
            success: function (e) {
                if (e == "1") {
                    swal({ title: "Müşteri başarı ile güncellendi", type: "success", timer: 1000, showConfirmButton: false });
                    CustomerOne();
                    return;
                }
            }
        });
    }
    else {
        swal("Lütfen formu eksiksiz doldurunuz!!", "", "error");
    }
});
//MÜŞTERİ GÜNCELLEME İŞLEMİNİ İPTAL EDEN BUTON
$(document).on("click", "#m-iptal", function () {
    mg1.option('value', customer[0].Ad);
    mg11.option('value', customer[0].FaturaUnvani);
    mg2.option('value', customer[0].SektorId);
    mg3.option('value', customer[0].FirmaTipId);
    mg4.option('value', customer[0].FirmaTurId);
    mg5.option('value', customer[0].IlId);
    mg6.option('value', customer[0].Ilce);
    mg7.option('value', customer[0].Adres);
    mg8.option('value', customer[0].Email);
    mg9.option('value', customer[0].TelNo);
    mg9.option('isValid', true);
    var opt = parseInt(customer[0].Aktif);
    mg10.option('value', opt);
});
//YETKİLİ KAYDETME İŞLEMİ
$(document).on("click", "#y-kaydet", function () {
    if (checkallvalid([mya1, mya2, mya3, mya4, mya5])) {
        $.ajax({
            type: "post",
            url: "../../Main/Authorized_SET_DATA",
            data: {
                CustomerId: customer[0].Id,
                Ad: mya1.option('value'),
                Soyad: mya2.option('value'),
                Unvan: mya3.option('value'),
                Telefon: mya4.option('value'),
                Email: mya5.option('value')
            },
            success: function (data) {
                yetkili_GET_DATA();
                $('#mdl-mya').modal('toggle');
                swal({ title: "Yetkili başarı ile eklendi", type: "success", timer: 1000, showConfirmButton: false });
            }
        });
    }
    else {
        swal("Lütfen formu eksiksiz doldurunuz!!", "", "error");
    }
});

//YETKİLİYİ GÜNCELLEME İŞLEMİ
$(document).on("click", ".btn-yg", function () {
    var yet = DevExpress.data.query($("#m-t-l").dxList('instance').option('items'))
    .filter([["Id", "=", $(this).attr('id')]]).toArray();
    console.log(yet);
    myg1.option("value", yet[0].Ad);
    myg2.option("value", yet[0].Soyad);
    myg3.option("value", yet[0].Unvan);
    var telefon = $.trim(yet[0].Telefon);
    myg4.option("value", telefon);
    myg5.option("value", yet[0].Email);
    $("#mdl-myg").modal('show');
});
$(document).on("click", ".btn-mag", function () {
    var yet = DevExpress.data.query($("#m-a-l").dxList('instance').option('items'))
   .filter([["Id", "=", $(this).attr('id')]]).toArray();
    aktg1.option("value", yet[0].Aktivite);
    aktg2.option("value", yet[0].Yetkili);
    aktg3.option("value", yet[0].AktiviteNotu);
    aktg4.option("value", yet[0].AktiviteSonucu);
    var hatirlatma = yet[0].Hatirlatma;
    aktg5.option("value", hatirlatma);

    if (hatirlatma == "Evet") {
        $("#hatirlatmagordiv").css("display", "block");
        aktg6.option("value", yet[0].HatirlatmaMesaji);
        aktg7.option("value", moment(yet[0].HatirlatmaTarihi, "DD.MM.YYYY HH:mm:ss").toDate());
    }
    $("#mdl-AktiviteDuzenle").modal("show");
});
$(document).on("click", ".btn-mas", function () {
    swal({ title: "Silmek istediğinize emin misiniz?", text: "Seçtiğiniz aktivite silinecektir, geri dönüşü mümkün değildir!", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "Onaylıyorum!", cancelButtonText: "Onaylamıyorum!", closeOnConfirm: false, closeOnCancel: false }, function (isConfirm) {
        if (isConfirm) {
            swal({ title: "Silindi!", text: "Müşteri başarı ile silindi.", timer: 1000, showConfirmButton: false });
            $.ajax({
                url: "../../Main/CustomerActivity_DELETE",
                data: {
                    Id: musteriaktivitelist.Id
                },
                success: function (data) {
                    aktivite_GET_DATA();
                }
            });

        }
        else { swal({ title: "İşlem iptal Edildi", text: "Müşteri kaydınız silinmedi ", timer: 1000, showConfirmButton: false }); return; }
    });
})
$(document).on("click", "#AktiviteGuncelle", function () {
    if ($(this).text() == "Güncelle") {
        ReadOnlyYap($("#mdl-AktiviteDuzenle"), false);
        $(this).text("Kaydet");
    }
    else {
        $.ajax({
            url: "../../Main/CustomerActivity_UPDATE",
            data: {
                id: musteriaktivitelist.Id,
                Aktivite: aktg1.option("value"),
                Yetkili: aktg2.option("value"),
                AktiviteNotu: aktg3.option("value"),
                AktiviteSonucu: aktg4.option("value"),
                Hatirlatma: aktg5.option("value"),
                HatirlatmaMesaji: aktg6.option("value"),
                HatirlatmaTarihi: moment(aktg7.option("value")).format("YYYY-MM-DD HH:mm:ss")
            },
            success: function () {
                $("#mdl-AktiviteDuzenle").modal("hide");
                swal({ title: "Aktivite başarı ile güncellendi", type: "success", timer: 1000, showConfirmButton: false });
                aktivite_GET_DATA();
            }
        })
    }
});
$(document).on("click", "#y-guncelle", function () {
    if (checkallvalid([myg1, myg2, myg3, myg4, myg5])) {
        $.ajax({
            type: "post",
            url: "../../Main/Authorized_UPDATE_DATA",
            data: {
                Id: yetkili.Id,
                Ad: myg1.option('value'),
                Soyad: myg2.option('value'),
                Unvan: myg3.option('value'),
                Telefon: myg4.option('value'),
                Email: myg5.option('value')
            },
            success: function (data) {
                yetkili_GET_DATA();


                $('#mdl-myg').modal('toggle');
                swal({ title: "Yetkili başarı ile güncellendi", type: "success", timer: 1000, showConfirmButton: false });
            }
        });
    }
    else {
        swal("Lütfen formu eksiksiz doldurunuz!!", "", "error");
    }
});
$(document).on("click", "y-guncelleiptal", function () {
    myg1.reset();
    myg2.reset();
    myg3.reset();
    myg4.reset();
    myg5.reset();
});
//YETKİLİYİ SİLME İŞLEMİ
$(document).on("click", ".btn-ys", function () {
    swal({ title: "Silmek istediğinize emin misiniz?", text: "Seçtiğiniz müşteri silinecektir, geri dönüşü mümkün değildir!", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "Onaylıyorum!", cancelButtonText: "Onaylamıyorum!", closeOnConfirm: false, closeOnCancel: false }, function (isConfirm) {
        if (isConfirm) {
            swal({ title: "Silindi!", text: "Müşteri başarı ile silindi.", timer: 1000, showConfirmButton: false });
            $.ajax({
                url: "../../Main/Authorized_DELETE",
                data: {
                    Id: yetkili.Id
                },
                success: function (data) {
                    yetkili_GET_DATA();
                }
            });

        }
        else { swal({ title: "İşlem iptal Edildi", text: "Müşteri kaydınız silinmedi ", timer: 1000, showConfirmButton: false }); return; }
    });
});
function ReadOnlyYap(a, type) {
    var ss = a.find(".dx-widget");
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
function CustomerOne() {
    $.ajax({
        url: "../../Main/CustomerOne",
        data: {
            Id: customer[0].Id
        },
        type: "POST",
        success: function (data) {
            customer = JSON.parse(data);
        }
    });
}
$(document).on("click", "#istasyonlistelestir", function () {
    var count = it2.option("value");
    var dt = $("#i-t-1").dxTagBox("instance").option("dataSource");
    var dts = $("#i-t-1").dxTagBox("instance").option("values");
    if (dts != "") {
        var l = dts.length;
        for (var i = 0; i < count; i++) {
            for (var j = 0; j < l; j++) {
                var satir = $("<div>").addClass("row"),
                numara = $("<div>").addClass("col-xs-1 numara")
                istasyon = $("<div>").addClass("col-xs-3 istasyon")
                yer = $("<div>").addClass("col-xs-3 yer")
                tarih = $("<div>").addClass("col-xs-1 tarih")
                aciklama = $("<div>").addClass("col-xs-3 aciklama")
                satir.appendTo("#mdl-istTanimla .modal-body .d").append(numara).append(istasyon).append(yer).append(tarih).append(aciklama);


                istasyon.dxSelectBox({
                    dataSource: dt,
                    value: dts[j],
                    displayExpr: "Ad",
                    valueExpr: "Id"
                });
                yer.dxTextBox({
                    placeholder: "Yer bilgisi giriniz",
                }).dxTextBox("instance");
                tarih.dxDateBox({ formatString: 'dd.MM.yyyy' }).dxDateBox("instance");
                aciklama.dxTextBox({ placeholder: "Açıklama giriniz" }).dxTextBox("instance");
                numara.text(++istasyonumara);
            }
        }
    }
    else {
        swal("Lütfen hizmet seçiniz!!", "", "error");
    }

});
$(document).on("click", "#yetkilimodalac", function () {
    $("#mdl-mya").modal('show');
});
$(document).on("click", "#musteriIstasyonKaydet", function () {
    var modal = $(this).closest("#mdl-istTanimla"),
        rows = modal.find(".d .row"),
        istasyonlarData = [],
        istasyonData = {};

    rows.each(function (i) {
        istasyonData = {
            IstasyonId: $(this).children(".istasyon").dxSelectBox("instance").option("value"),
            Yer: $(this).children(".yer").dxTextBox("instance").option("value"),
            Tarih: moment($(this).children(".tarih").dxDateBox("instance").option("value")).format("YYYY-MM-DD"),
            Aciklama: $(this).children(".aciklama").dxTextBox("instance").option("value"),
            MusteriId: customer[0].Id,
            Numara: $(this).children(".numara").text()
        }
        istasyonlarData.push(istasyonData);
    });

    $.ajax({
        url: "../../Main/StationCustomer_SET",
        data: {
            istasyonlar: JSON.stringify(istasyonlarData)
        },
        success: function () {
            istasyonListele();
            $("#mdl-istTanimla").modal("hide");
            swal({ title: "İstasyon başarı  ile müşteriye kaydedildi ", type: "success", timer: 1000, showConfirmButton: false });

        }
    })
});
$(document).on("click", "#sozlesmelistelestir", function () {
    var islemsayisi = hs1.option("value");
    var dt = $("#h-s-6").dxTagBox("instance").option("dataSource");
    var dts = $("#h-s-6").dxTagBox("instance").option("values");
    if (dts.length) {
        var defEmp = $.Deferred();
        var empdatas = [];
        var emp = {};
        $.ajax({
            url: "../../Main/SozlesmeEmployee",
            success: function (data) {

                var data = JSON.parse(data);
                for (var i = 0; i < data.length; i++) {
                    emp = {
                        AdSoyad: data[i].Ad + " " + data[i].Soyad,
                        Id: data[i].Id
                    }
                    empdatas.push(emp);
                }
                defEmp.resolve(empdatas);
            }
        });

        defEmp.done(function (data) {
            for (var i = 0; i < islemsayisi; i++) {
                var satir = $("<div>").addClass("row"),
                    hizmet = $("<div>").addClass("col-xs-4 hizmettipi"),
                    personel = $("<div>").addClass("col-xs-2 personel"),
                    tarih = $("<div>").addClass("col-xs-2 tarih"),
                    aciklama = $("<div>").addClass("col-xs-3 aciklama");
                satir.appendTo("#mdl-hsd .modal-body .c").append(hizmet).append(personel).append(tarih).append(aciklama);
                console.log(dts);
                hizmet.dxTagBox({
                    placeholder: 'Hizmet tipi seçiniz',
                    dataSource: dt,
                    values: dts.slice(0, dts.length),
                    displayExpr: "HizmetAdi",
                    valueExpr: "Id"
                });

                personel.dxSelectBox({
                    placeholder: "Personel seçiniz",
                    dataSource: empdatas,
                    displayExpr: "AdSoyad",
                    valueExpr: "Id"
                });
                tarih.dxDateBox({ format: 'datetime' });
                aciklama.dxTextBox({ placeholder: "Açıklama giriniz" });
            }
        });
    }
    else {
        swal("Lütfen hizmet seçiniz!!", "", "error");
    }
});
$(document).on("click", "#hs-kaydet", function () {
    var modal = $(this).closest("#mdl-hsd"),
        rows = modal.find(".c .row"),
        hizmetlerData = [],
        hizmetData = {};

    rows.each(function (i) {
        hizmetData = {
            HizmetAdi: $(this).children(".hizmettipi").dxTagBox("instance").option("values").toString(),
            Personel: $(this).children(".personel").dxSelectBox("instance").option("value"),
            Tarih: moment($(this).children(".tarih").dxDateBox("instance").option("value")).format("YYYY-MM-DD HH:mm"),
            Aciklama: $(this).children(".aciklama").dxTextBox("instance").option("value"),
            MusteriId: customer[0].Id
        }
        hizmetlerData.push(hizmetData);
    });

    $.ajax({
        url: "../../Main/Sozlesme_SET",
        type: "post",
        data: {
            hizmetler: JSON.stringify(hizmetlerData)
        },
        success: function () {
            temizle($("#mdl-hsd"));
            $("#mdl-hsd").modal("hide");
            swal({ title: "Hizmet sözleşmesi başarı kaydedildi ", type: "success", timer: 1000, showConfirmButton: false });
        }
    });
});
$(document).on("click", "#ekservis-kaydet", function () {
    if (checkallvalid([esp1, esp2, esp3])) {
        $.ajax({
            url: "../../Main/EkSozlesme_SET",
            data: {
                HizmetTipi: esp1.option("values").toString(),
                Personel: esp2.option("value"),
                Tarih: moment(esp3.option("value")).format("YYYY-MM-DD HH:mm"),
                Aciklama: esp5.option("value"),
                MusteriId: customer[0].Id
            },
            success: function () {
                $("#mdl-esp").modal("hide");
                swal({ title: "Ek servis planlama başarı kaydedildi ", type: "success", timer: 1000, showConfirmButton: false });
            }
        });
    }
    else {
        swal("Lütfen formu eksiksiz doldurunuz!!", "", "error");
    }

});
//MÜŞTERİYE AKTİVİTE KAYDET
$(document).on("click", "#AktiviteKaydet", function () {
    var durum = $("#akt-e-5").dxRadioGroup("instance").option("value");
    if (durum == "Hayır") {
        if (checkallvalid([akte1, akte4])) {
            $.ajax({
                url: "../../Main/CustomerActivity_SET",
                data: {
                    MusteriId: customer[0].Id,
                    Aktivite: akte1.option("value"),
                    Yetkili: akte2.option("value"),
                    AktiviteNotu: akte3.option("value"),
                    AktiviteSonucu: akte4.option("value"),
                    Hatirlatma: $("#akt-e-5").dxRadioGroup("instance").option("value"),
                    HatirlatmaMesaji: akte6.option("value"),
                    HatirlatmaTarihi: akte7.option("value")
                },
                success: function () {
                    $("#mdl-AktiviteYonetimi").modal("hide");
                    aktivite_GET_DATA();
                    swal({ title: "Aktivite başarı ile müşteriye eklendi", type: "success", timer: 1000, showConfirmButton: false });
                }
            });
        }
        else {
            swal("Lütfen formu eksiksiz doldurunuz!!", "", "error");
        }
    }
    else {
        if (checkallvalid([akte1, akte4, akte6, akte7])) {
            $.ajax({
                url: "../../Main/CustomerActivity_SET",
                data: {
                    MusteriId: customer[0].Id,
                    Aktivite: akte1.option("value"),
                    Yetkili: akte2.option("value"),
                    AktiviteNotu: akte3.option("value"),
                    AktiviteSonucu: akte4.option("value"),
                    Hatirlatma: $("#akt-e-5").dxRadioGroup("instance").option("value"),
                    HatirlatmaMesaji: akte6.option("value"),
                    HatirlatmaTarihi: moment(akte7.option("value")).format("YYYY-MM-DD HH:mm:ss")
                },
                success: function () {
                    $("#mdl-AktiviteYonetimi").modal("hide");
                    swal({ title: "Aktivite başarı ile müşteriye eklendi", type: "success", timer: 1000, showConfirmButton: false });
                }
            });
        }
        else {
            swal("Lütfen formu eksiksiz doldurunuz!!", "", "error");
        }
    }
});
$(document).on("click", "#y-toggle", function () {
    $("#m-t-l").slideToggle(250)
});
$(document).on("click", "#a-toggle", function () {
    $("#m-a-l").slideToggle(250)
});
$(document).on("hidden.bs.modal", "#mdl-hsd", function (e) {
    $(".c").empty();
    temizle($("#mdl-hsd"));
});
$(document).on("hidden.bs.modal", "#mdl-istTanimla", function () {
    $(".d").empty();
    temizle($("#mdl-istTanimla"));
})
$(document).on("hidden.bs.modal", "#mdl-esp", function (e) {
    temizle($("#mdl-esp"));
});
$(document).on("hidden.bs.modal", "#mdl-mya", function (e) {
    temizle($("#mdl-mya"));
});
$(document).on("hidden.bs.modal", "#mdl-AktiviteYonetimi", function (e) {

    akte1.reset();
    akte2.reset();
    akte3.reset();
    akte4.reset();
    akte6.reset();
    akte7.reset();

    $("#akt-e-7").dxDateBox({ format: "datetime", value: new Date() }).dxDateBox("instance");
    $("#akt-e-5").dxRadioGroup("instance").option({
        onValueChanged: function (e) {
            if (e.value == "Hayır") {
                $("#hatirlatmadiv").css("display", "none");
            }
            else {
                $("#hatirlatmadiv").css("display", "block");
            }
        },
        value: "Hayır",
        items: sonuc
    });
    $("#hatirlatmadiv").css("display", "none");
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
