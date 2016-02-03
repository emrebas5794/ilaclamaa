
var datas = [];
var data = {};
var resourcesData = [];
var resources = {};

for (var i = 0; i < service.length; i++) {
    data = {
        text: service[i].Ad + " - " + service[i].HizmetTipAdi,
        startDate: new Date(moment(service[i].Tarih, "DD.MM.YYYY HH:mm:ss").format("YYYY-MM-DD HH:mm:ss")),
        endDate: new Date(moment(service[i].Tarih, "DD.MM.YYYY HH:mm:ss").add(1, 'hours').format("YYYY-MM-DD HH:mm:ss")),
        ownerId:[i]
    }
    datas.push(data);
}

for (var i = 0; i < service.length; i++) {
    resources = {
        text:"",
        id: i,
        color: service[i].Renk
    }
    resourcesData.push(resources);
}


$(document).ready(function () {
    $(".dx-scheduler-scrollable-appointments").css("display", "none");
});

var s = $(".scheduler").dxScheduler({
    dataSource: datas,
    views: ["month", "week", "day"],
    currentView: "week",
    currentDate: new Date(),
    firstDayOfWeek: 1,
    startDayHour: 8,
    endDayHour: 19,
    resources: [
        {
            field: "ownerId",
            allowMultiple: true,
            dataSource: resourcesData,
            label: "Renk"
        }],

    width: "100%",
    height: 600
});





















