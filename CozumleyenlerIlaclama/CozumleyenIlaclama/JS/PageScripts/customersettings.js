var mtur1 = $("#m-tur-1").dxSelectBox({ placeholder: 'Firma Türleri' }).dxSelectBox('instance');
var mtur2 = $("#m-tur-2").dxTextBox({ placeholder: 'Firma Türü giriniz', isValid: false }).dxTextBox('instance');
var mtur3 = $("#m-tur-3").dxSelectBox({ placeholder: 'Firma Tipleri' }).dxSelectBox('instance');
var mtur4 = $("#m-tur-4").dxTextBox({ placeholder: 'Firma Tipi giriniz', isValid: false }).dxTextBox('instance');
var mtur5 = $("#m-tur-5").dxSelectBox({ placeholder: 'Sektörler' }).dxSelectBox('instance');
var mtur6 = $("#m-tur-6").dxTextBox({ placeholder: 'Sektör giriniz', isValid: false }).dxTextBox('instance');
var mtur7 = $("#m-tur-7").dxTextBox({ isValid: false }).dxTextBox('instance');
var mtur8 = $("#m-tur-8").dxTextBox({ isValid: false }).dxTextBox('instance');
var mtur9 = $("#m-tur-9").dxTextBox({ isValid: false }).dxTextBox('instance');
var mtur10 = $("#m-tur-10").dxSelectBox({ placeholder: 'Firma Durumları' }).dxSelectBox('instance');
var mtur11 = $("#m-tur-11").dxTextBox({ isValid: false }).dxTextBox('instance');
var mtur12 = $("#m-tur-12").dxTextBox({ placeholder: 'Durum giriniz', isValid: false }).dxTextBox('instance');

$(document).ready(function () {
    CustomerType();
    CustomerKind();
    Sector();
    Situation();
});
function Sector() {
    $.ajax({
        url: "../../Main/Sector_GET_DATA",
        success: function (data) {
            var result = JSON.parse(data);
            $("#m-tur-5").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'Sektor'
            });
        }
    });
}

function CustomerType() {
    $.ajax({
        url: "../../Main/CustomerType_GET_DATA",
        success: function (data) {
            var result = JSON.parse(data);
            $("#m-tur-1").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'FirmaTur'
            });
        }
    });
}

function CustomerKind() {
    $.ajax({
        url: "../../Main/CustomerKind_GET_DATA",
        success: function (data) {
            var result = JSON.parse(data);
            $("#m-tur-3").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'FirmaTip'
            });
        }
    });
}

function Situation() {
    $.ajax({
        url: "../../Main/Situation_GET_DATA",
        success: function (data) {
            var result = JSON.parse(data);
            $("#m-tur-10").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'Durum'
            });
        }
    })
}

$(document).on("click", "#tursil", function () {
    var secilentur = mtur1.option("value");
    if (secilentur == null) {
        swal({ title: "Firma Türü silmek için lütfen önce seçim yapınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        swal({ title: "Silmek istediğinize emin misiniz?", text: "Seçtiğiniz müşteri silinecektir, geri dönüşü mümkün değildir!", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "Onaylıyorum!", cancelButtonText: "Onaylamıyorum!", closeOnConfirm: false, closeOnCancel: false }, function (isConfirm) {
            if (isConfirm) {
                swal({ title: "Silindi!", text: "Müşteri başarı ile silindi.", timer: 1000, showConfirmButton: false });
                $.ajax({
                    url: "../../Main/CustomerType_DELETE",
                    data: {
                        Id: secilentur
                    },
                    success: function () {
                        CustomerType();
                    }
                });
            }
            else { swal({ title: "İşlem iptal Edildi", text: "Müşteri kaydınız silinmedi ", timer: 1000, showConfirmButton: false }); return; }
        });
    }
});

$(document).on("click", "#turguncelle", function () {
    var secilentur = mtur1.option("value");
    if (secilentur != null) {
        $("#turguncellediv").css("display", "block");
    }
    else {
        swal({ title: "Firma Türü güncellemek için lütfen önce seçim yapınız", type: "warning", timer: 1000, showConfirmButton: false });
    }

});

$(document).on("click", "#turkaydet", function () {
    var text = mtur7.option("value");
    if (text == "") {
        swal({ title: "Firma Türü güncellemek için lütfen metin giriniz", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        var id = mtur1.option("value");
        $.ajax({
            url: "../../Main/CustomerType_UPDATE_DATA",
            data: {
                Id: id,
                FirmaTur: text
            },
            success: function () {
                mtur7.reset();
                CustomerType();
                $("#turguncellediv").css("display", "none");
            }
        });
    }

});

$(document).on("click", "#turekle", function () {
    var tur = mtur2.option("value");
    if (tur == "") {
        swal({ title: "Firma Türü eklemek için lütfen boş bırakmayınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        $.ajax({
            url: "../../Main/CustomerType_SET_DATA",
            data: {
                firmatur: tur
            },
            success: function () {
                CustomerType();
                mtur2.reset();
            }
        });

    }

});

$(document).on("click", "#tipsil", function () {
    var secilentip = mtur3.option("value");
    if (secilentip == null) {
        swal({ title: "Firma Tipi silmek için lütfen önce seçim yapınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        swal({ title: "Silmek istediğinize emin misiniz?", text: "Seçtiğiniz müşteri silinecektir, geri dönüşü mümkün değildir!", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "Onaylıyorum!", cancelButtonText: "Onaylamıyorum!", closeOnConfirm: false, closeOnCancel: false }, function (isConfirm) {
            if (isConfirm) {
                swal({ title: "Silindi!", text: "Müşteri başarı ile silindi.", timer: 1000, showConfirmButton: false });
                $.ajax({
                    url: "../../Main/CustomerKind_DELETE",
                    data: {
                        Id: secilentip
                    },
                    success: function () {
                        CustomerKind();
                    }
                });
            }
            else { swal({ title: "İşlem iptal Edildi", text: "Müşteri kaydınız silinmedi ", timer: 1000, showConfirmButton: false }); return; }
        });
    }
});

$(document).on("click", "#tipekle", function () {
    var tip = mtur4.option("value");
    if (tip == "") {
        swal({ title: "Firma Türü eklemek için lütfen boş bırakmayınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        $.ajax({
            url: "../../Main/CustomerKind_SET_DATA",
            data: {
                firmatip: tip
            },
            success: function () {
                CustomerKind();
                mtur4.reset();
            }
        });

    }

});

$(document).on("click", "#tipguncelle", function () {
    var secilentip = mtur3.option("value");
    if (secilentip != null) {
        $("#tipguncellediv").css("display", "block");
    }
    else {
        swal({ title: "Firma Türü güncellemek için lütfen önce seçim yapınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
});

$(document).on("click", "#tipkaydet", function () {
    var text = mtur8.option("value");
    if (text == "") {
        swal({ title: "Firma Türü güncellemek için lütfen metin giriniz", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        var id = mtur3.option("value");
        $.ajax({
            url: "../../Main/CustomerKind_UPDATE_DATA",
            data: {
                Id: id,
                FirmaTip: text
            },
            success: function () {
                mtur8.reset();
                CustomerKind();
                $("#tipguncellediv").css("display", "none");
            }
        });
    }
});

$(document).on("click", "#sektorsil", function () {
    var secilensektor = mtur5.option("value");
    if (secilensektor == null) {
        swal({ title: "Sektor silmek için lütfen önce seçim yapınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        swal({ title: "Silmek istediğinize emin misiniz?", text: "Seçtiğiniz müşteri silinecektir, geri dönüşü mümkün değildir!", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "Onaylıyorum!", cancelButtonText: "Onaylamıyorum!", closeOnConfirm: false, closeOnCancel: false }, function (isConfirm) {
            if (isConfirm) {
                swal({ title: "Silindi!", text: "Müşteri başarı ile silindi.", timer: 1000, showConfirmButton: false });
                $.ajax({
                    url: "../../Main/Sector_DELETE_DATA",
                    data: {
                        Id: secilensektor
                    },
                    success: function () {
                        Sector();
                    }
                });

            }
            else { swal({ title: "İşlem iptal Edildi", text: "Müşteri kaydınız silinmedi ", timer: 1000, showConfirmButton: false }); return; }
        });
    }
});

$(document).on("click", "#sektorekle", function () {
    var sector = mtur6.option("value");
    if (sector == "") {
        swal({ title: "Sektör eklemek için lütfen boş bırakmayınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        $.ajax({
            url: "../../Main/Sector_SET_DATA",
            data: {
                Sektor: sector
            },
            success: function () {
                Sector();
                mtur6.reset();
            }
        });

    }

});

$(document).on("click", "#sektorguncelle", function () {
    var secilensektor = mtur5.option("value");
    if (secilensektor != null) {
        $("#sektorguncellediv").css("display", "block");
    }
    else {
        swal({ title: "Sektor güncellemek için lütfen önce seçim yapınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
});

$(document).on("click", "#sektorkaydet", function () {
    var text = mtur9.option("value");
    if (text == "") {
        swal({ title: "Sektor güncellemek için lütfen metin giriniz", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        var id = mtur5.option("value");
        $.ajax({
            url: "../../Main/Sector_UPDATE_DATA",
            data: {
                Id: id,
                Sektor: text
            },
            success: function () {
                mtur9.reset();
                Sector();
                $("#sektorguncellediv").css("display", "none");
            }
        });
    }
});

$(document).on("click", "#durumsil", function () {
    var secilendurum = mtur10.option("value");
    if (secilendurum == null) {
        swal({ title: "Durum silmek için lütfen önce seçim yapınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        swal({ title: "Silmek istediğinize emin misiniz?", text: "Seçtiğiniz müşteri silinecektir, geri dönüşü mümkün değildir!", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "Onaylıyorum!", cancelButtonText: "Onaylamıyorum!", closeOnConfirm: false, closeOnCancel: false }, function (isConfirm) {
            if (isConfirm) {
                swal({ title: "Silindi!", text: "Müşteri başarı ile silindi.", timer: 1000, showConfirmButton: false });
                $.ajax({
                    url: "../../Main/Situation_DELETE_DATA",
                    data: {
                        Id: secilendurum
                    },
                    success: function () {
                        Situation();
                    }
                });

            }
            else { swal({ title: "İşlem iptal Edildi", text: "Müşteri kaydınız silinmedi ", timer: 1000, showConfirmButton: false }); return; }
        });

    }
});

$(document).on("click", "#durumekle", function () {
    var durum = mtur12.option("value");
    if (durum == "") {
        swal({ title: "Durum eklemek için lütfen boş bırakmayınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        $.ajax({
            url: "../../Main/Situation_SET_DATA",
            data: {
                Durum: durum
            },
            success: function () {
                Situation();
                mtur12.reset();
            }
        });

    }

});

$(document).on("click", "#durumguncelle", function () {
    var secilensektor = mtur10.option("value");
    if (secilensektor != null) {
        $("#durumguncellediv").css("display", "block");
    }
    else {
        swal({ title: "Durum güncellemek için lütfen önce seçim yapınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
});

$(document).on("click", "#durumkaydet", function () {
    var text = mtur11.option("value");
    if (text == "") {
        swal({ title: "Durum güncellemek için lütfen metin giriniz", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        var id = mtur10.option("value");
        $.ajax({
            url: "../../Main/Situation_UPDATE_DATA",
            data: {
                Id: id,
                Durum: text
            },
            success: function () {
                mtur11.reset();
                Situation();
                $("#durumguncellediv").css("display", "none");
            }
        });
    }
});
