var ea1 = $("#e-a-1").dxSelectBox({ placeholder: 'Bölgeler' }).dxSelectBox('instance');
var ea2 = $("#e-a-2").dxTextBox({ isValid: false }).dxTextBox('instance');
var ea3 = $("#e-a-3").dxTextBox({ placeholder: 'Bölge giriniz', isValid: false }).dxTextBox('instance');

$(document).ready(function () {
    region_Get();

});


function region_Get() {
    $.ajax({
        url: "../../Main/Regions_GET",
        success: function (data) {
            var result = JSON.parse(data);
            $("#e-a-1").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'Bolge'
            });
        }
    });
}

$(document).on("click", "#bolgesil", function () {
    var secilenbolge = ea1.option("value");
    if (secilenbolge == null) {
        swal({ title: "Bölge silmek için lütfen önce seçim yapınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        swal({ title: "Silmek istediğinize emin misiniz?", text: "Seçtiğiniz bölge silinecektir, geri dönüşü mümkün değildir!", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "Onaylıyorum!", cancelButtonText: "Onaylamıyorum!", closeOnConfirm: false, closeOnCancel: false }, function (isConfirm) {
            if (isConfirm) {
                swal({ title: "Silindi!", text: "Bölge başarı ile silindi.", timer: 1000, showConfirmButton: false });
                $.ajax({
                    url: "../../Main/Regions_DELETE",
                    data: {
                        Id: secilenbolge
                    },
                    success: function () {
                        region_Get();
                    }
                });
            }
            else { swal({ title: "İşlem iptal Edildi", text: "Müşteri kaydınız silinmedi ", timer: 1000, showConfirmButton: false }); return; }
        });
    }
});

$(document).on("click", "#bolgeguncelle", function () {
    var secilenbolge = ea1.option("value");
    if (secilenbolge != null) {
        $("#bolgeguncellediv").css("display", "block");
    }
    else {
        swal({ title: "Bölge güncellemek için lütfen önce seçim yapınız", type: "warning", timer: 1000, showConfirmButton: false });
    }

});

$(document).on("click", "#bolgekaydet", function () {
    var text = ea2.option("value");
    if (text == "") {
        swal({ title: "Bölge güncellemek için lütfen metin giriniz", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        var id = ea1.option("value");
        $.ajax({
            url: "../../Main/Regions_UPDATE_DATA",
            data: {
                Id: id,
                Bolge: text
            },
            success: function () {
                ea2.reset();
                region_Get();
                $("#bolgeguncellediv").css("display", "none");
            }
        });
    }

});

$(document).on("click", "#bolgeekle", function () {
    var bolge = ea3.option("value");
    if (bolge == "") {
        swal({ title: "Bölge eklemek için lütfen boş bırakmayınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        $.ajax({
            url: "../../Main/Regions_SET_DATA",
            data: {
                Bolge: bolge
            },
            success: function () {
                region_Get();
                ea3.reset();
            }
        });

    }

});