var hg1 = $("#h-g-1").dxSelectBox({ placeholder: 'Hizmet Grupları' }).dxSelectBox('instance');
var hg2 = $("#h-g-2").dxTextBox({valueChangeEvent: "keyup", onValueChanged: function (e) { hg2.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxTextBox('instance');
var hg3 = $("#h-g-3").dxTextBox({ placeholder: 'Hizmet grubu giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { hg3.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxTextBox('instance');

$(document).ready(function () {
    servicegroup_Get();
});

function servicegroup_Get() {
    $.ajax({
        url: "../../Main/ServiceGroup_GET",
        success: function (data) {
            var result = JSON.parse(data);
            $("#h-g-1").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'HizmetGrup'
            });
        }
    });
}

$(document).on("click", "#hizmetgrupsil", function () {
    var secilenhizmetgrup = hg1.option("value");
    if (secilenhizmetgrup == null) {
        swal({ title: "Hizmet grubu silmek için lütfen önce seçim yapınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        swal({ title: "Silmek istediğinize emin misiniz?", text: "Seçtiğiniz hizmet grubu silinecektir, geri dönüşü mümkün değildir!", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "Onaylıyorum!", cancelButtonText: "Onaylamıyorum!", closeOnConfirm: false, closeOnCancel: false }, function (isConfirm) {
            if (isConfirm) {
                swal({ title: "Silindi!", text: "Hizmet grubu başarı ile silindi.", timer: 1000, showConfirmButton: false });
                $.ajax({
                    url: "../../Main/ServiceGroup_DELETE",
                    type: "post",
                    data: {
                        Id: secilenhizmetgrup
                    },
                    success: function () {
                        servicegroup_Get();
                    }
                });
            }
            else { swal({ title: "İşlem iptal Edildi", text: "Hizmet grubu silinmedi ", timer: 1000, showConfirmButton: false }); return; }
        });
    }
});

$(document).on("click", "#hizmetgrupguncelle", function () {
    var secilenhizmetgrup = hg1.option("value");
    if (secilenhizmetgrup != null) {
        $("#hizmetgrupguncellediv").css("display", "block");
    }
    else {
        swal({ title: "Hizmet grubu güncellemek için lütfen önce seçim yapınız", type: "warning", timer: 1000, showConfirmButton: false });
    }

});

$(document).on("click", "#hizmetgrupkaydet", function () {
    var text = hg2.option("value");
    if (text == "") {
        swal({ title: "Hizmet grubu güncellemek için lütfen metin giriniz", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        var id = hg1.option("value");
        $.ajax({
            url: "../../Main/ServiceGroup_UPDATE",
            type: "post",
            data: {
                Id: id,
                HizmetGrup: text
            },
            success: function () {
                hg2.reset();
                servicegroup_Get();
                $("#hizmetgrupguncellediv").css("display", "none");
            }
        });
    }

});

$(document).on("click", "#hizmetgrupekle", function () {
    var hizmetgrup = hg3.option("value");
    if (hizmetgrup == "") {
        swal({ title: "Hizmet grubu eklemek için lütfen boş bırakmayınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        $.ajax({
            url: "../../Main/ServiceGroup_SET",
            type:"post",
            data: {
                HizmetGrup: hizmetgrup
            },
            success: function () {
                servicegroup_Get();
                hg3.reset();
            }
        });

    }

});