var ist1 = $("#ist-1").dxSelectBox({ placeholder: 'İstasyonlar', valueChangeEvent: "keyup", onValueChanged: function (e) { ist1.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }}).dxSelectBox("instance");
var ist2 = $("#ist-2").dxTextBox({ placeholder: 'İstasyon adı giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { ist2.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxTextBox('instance');
var ist3 = $("#ist-3").dxTextBox({ placeholder: 'İstasyon türü giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { ist3.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxTextBox('instance');
var ist4 = $("#ist-4").dxTextBox({ placeholder: 'Açıklama giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { ist4.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxTextBox('instance');
var ist5 = $("#ist-5").dxTextBox({ placeholder: 'İstasyon adı giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { ist5.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxTextBox('instance');
var ist6 = $("#ist-6").dxTextBox({ placeholder: 'İstasyon türü giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { ist6.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxTextBox('instance');
var ist7 = $("#ist-7").dxTextBox({ placeholder: 'Açıklama giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { ist7.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxTextBox('instance');

$(document).ready(function () {
    istasyon();

});

function istasyon ()
{
    $.ajax({
        url: "../../Main/Station_GET",
        type: "post",
        success: function (data) {
            var ist = JSON.parse(data);
            $("#ist-1").dxSelectBox({
                dataSource: ist,
                valueExpr: "Id",
                displayExpr: "Ad",
            });
        }
    });
}

$(document).on("click", "#yeniIstasyon", function () {
    $(".yeniIstEkle").css("display", "block");
});

$(document).on("click", "#istasyonkaydet", function () {
    $.ajax({
        url: "../../Main/Station_SET",
        type: "post",
        data: {
            Ad: ist2.option("value"),
            Tur: ist3.option("value"),
            Aciklama: ist4.option("value")
        },
        success: function () {
            ist2.reset();
            ist3.reset();
            ist4.reset();
            $(".yeniIstEkle").css("display", "none");
            istasyon();
            swal({ title: "İstasyon başarı ile eklendi", type: "success", timer: 1000, showConfirmButton: false });
        }
    })
});

$(document).on("click", "#istasyonguncelle", function () {
    var secili = ist1.option("value");
    if (secili !=null) {
        $(".IstGuncelle").css("display", "block");
        $.ajax({
            url: "../../Main/StationOne",
            data: { Id: secili },
            success: function (data) {
                var datas = JSON.parse(data);
                ist5.option("value", datas[0].Ad);
                ist6.option("value", datas[0].Tur);
                ist7.option("value", datas[0].Aciklama);
            }
        });
    }
    
    else {
        swal({ title: "İstasyon güncellemek için lütfen önce seçim yapınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
});

$(document).on("click", "#istasyonguncellekaydet", function () {
    $.ajax({
        url: "../../Main/Station_UPDATE",
        type: "post",
        data: {
            Id: ist1.option("value"),
            Ad: ist5.option("value"),
            Tur: ist6.option("value"),
            Aciklama: ist7.option("value")
        },
        success: function () {
            ist5.reset();
            ist6.reset();
            ist7.reset();
            istasyon();
            $(".IstGuncelle").css("display", "none");
        }
    })

});

$(document).on("click", "#istasyonsil", function () {
    var secili = ist1.option("value");
    if (secili == null) {
        swal({ title: "İstasyon güncellemek için lütfen önce seçim yapınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        swal({ title: "Silmek istediğinize emin misiniz?", text: "Seçtiğiniz müşteri silinecektir, geri dönüşü mümkün değildir!", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "Onaylıyorum!", cancelButtonText: "Onaylamıyorum!", closeOnConfirm: false, closeOnCancel: false }, function (isConfirm) {
            if (isConfirm) {
                swal({ title: "Silindi!", text: "Müşteri başarı ile silindi.", timer: 1000, showConfirmButton: false });
                $.ajax({
                    url: "../../Main/Station_DELETE",
                    type:"post",
                    data: {
                        Id: secili
                    },
                    success: function () {
                        istasyon();
                    }
                });

            }
            else { swal({ title: "İşlem iptal Edildi", text: "Müşteri kaydınız silinmedi ", timer: 1000, showConfirmButton: false }); return; }
        });
    }
});