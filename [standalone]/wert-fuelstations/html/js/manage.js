var ui_open = false;
var currentmenu = undefined;
let LANG = {};
let notiftimeout = undefined;
let salary_status = 0;
let addon_open = false;
let buy_menu = false;
let confirm_menu = false;
let transfer_id = 0;
let AccessData = {};

let truck_shop_open = false;
let truck_shop_data = {};
let truck_back_button = undefined;
let truck_next_button = undefined;

let my_color_id = undefined;
let last_color_element = undefined;

let fuel_progress_bar_open = false;

function CheckAccess(page) {
  if (AccessData.iamowner) {
    return true;
  } else {
    var my_emp_rank = AccessData.iamemployee;
    if (my_emp_rank != undefined && my_emp_rank != null) {
      let settings =  AccessData.settings;
      var conv_my_rank = '';
      if (my_emp_rank == 1) {
        conv_my_rank = '1'+LANG.rank_worker
      } else if (my_emp_rank == 2) {
        conv_my_rank = '2'+LANG.rank_manager
      } else if (my_emp_rank == 3) {
        conv_my_rank = '3'+LANG.rank_owner
      }
      if (settings[page] && settings[page][conv_my_rank]) {
        return true;
      }
    }
  }
  return false;
}

function OpenTankerProgressBar(duration, type) {
  if (!fuel_progress_bar_open) {
    fuel_progress_bar_open = true;
    var startwidth = 0;
    var targetwidth = '100%';
    if (type == "reload") {
      startwidth = '100%';
      targetwidth = '0%';
      $(".in-tanker-progress-1").css({"width": startwidth});
      $(".in-tanker-progress-2").css({"width": startwidth});
    } else {
      $(".in-tanker-progress-1").css({"width": '0%'});
      $(".in-tanker-progress-2").css({"width": '0%'});
    }
    $(".tanker").fadeIn('fast', function() {
      $(".in-tanker-progress-1").stop().css({"width": startwidth}).animate({
        width: targetwidth
      }, {
        duration: parseInt(duration),
        complete: function() {
          /* $(".tanker").fadeOut('fast', function() {
            fuel_progress_bar_open = false;
            $(".in-tanker-progress-1").css("width", 0);
            $.post('https://wert-fuelstations/TankerProgressFinish', JSON.stringify({}));
          }) */
        }
      });
      let wait_time = duration * 0.08;
      if (type == "reload") {
        wait_time = 0;
      } 
      setTimeout(function(){
        $(".in-tanker-progress-2").stop().css({"width": startwidth}).animate({
          width: targetwidth
        }, {
          duration: parseInt(duration - wait_time),
          complete: function() {
            $(".tanker").fadeOut('fast', function() {
              fuel_progress_bar_open = false;
              $(".in-tanker-progress-2").css("width", 0);
              $.post('https://wert-fuelstations/TankerProgressFinish', JSON.stringify({}));
            })
          }
        });
    }, wait_time)
    });
  }
}

function OpenTruckShop(data) {
  if (!truck_shop_open) {
    truck_shop_open = true;
    truck_shop_data  = {};
    truck_back_button = undefined;
    truck_next_button = undefined;
    $('.truck-shop').css('display', 'block');
    $('.truck-shop-mid').html('<div class="truck-shop-mid-cars"></div>');
    for (let i = 0; i < data.length; i++) {
      const element = data[i];
      truck_shop_data[element.model] = element;
      var conv_money = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(element.price);
      let htmlItem = `
        <div class="truck-shop-mid-cars-row">
          <div class="truck-shop-mid-cars-row-label">${element.label}</div>
          <img class="trucksellimage" src="${element.image}" alt="trucksellimage">
          <div class="truck-shop-mid-cars-row-bottom">
            <div class="truck-price">${conv_money}</div>
            <div class="truck-details" data-model="${element.model}">${LANG.truck_row_details}</div>
          </div>
        </div>
      `
      $('.truck-shop-mid-cars').append(htmlItem);
    }
  }
}

function CloseTruckShop(post) {
  if (truck_shop_open) {
    truck_shop_open = false;
    $('.truck-shop').css('display', 'none');
    $('.truck-shop-mid').html('<div class="truck-shop-mid-cars"></div>');

    if (post) {$.post('https://wert-fuelstations/Close', JSON.stringify({}));}
  }
}

function OpenConfirmMenu(action) {
  if (!confirm_menu) {
    confirm_menu = true;
    $('.confirm-menu').css('display', 'block');
    if (action == "transfer") {
      $('.confirm-menu').html(`
        <div class="confirm-menu-header"><i class="fa-solid fa-circle-info"></i> ${LANG.station_transfer_confirm}</div>
        <div class="confirm-menu-buttons">
          <div id="transfer-confirm-station" class="confirm-menu-button-yes"><i class="fa-solid fa-check"></i> ${LANG.confirm_menu_yes}</div>
          <div class="confirm-menu-button-no"><i class="fa-solid fa-xmark"></i> ${LANG.confirm_menu_no}</div>
        </div>
      `);
    } else if (action == "sell") {
      $.post('https://wert-fuelstations/GetCurrentShopData', JSON.stringify({}), function(ShopData){
        let calculate = ShopData.buy_price * ShopData.SellPercent / 100
        $('.confirm-menu').html(`
          <div class="confirm-menu-header"><i class="fa-solid fa-circle-info"></i> ${LANG.confirm_menu_sell_header}${calculate}?</div>
          <div class="confirm-menu-buttons">
            <div id="sell-confirm-station" class="confirm-menu-button-yes"><i class="fa-solid fa-check"></i> ${LANG.confirm_menu_yes}</div>
            <div class="confirm-menu-button-no"><i class="fa-solid fa-xmark"></i> ${LANG.confirm_menu_no}</div>
          </div>
        `);
      });
    }
  }
}

function CloseConfirmMenu() {
  if (confirm_menu) {
    confirm_menu = false;
    $('.confirm-menu').css('display', 'none');
  }
}

// sell-confirm-station

function CloseAddonMenu() {
  if (addon_open) {
    addon_open = false;
    $('#addon-menu').css('display', 'none');
    $('.addon-menu-mid').html('');
  }
}

function OpenAddonMenu(action) {
  if (!addon_open) {
    addon_open = true;
    $('#addon-menu').css('display', 'block');
    if (action == "transfer") {
      $.post('https://wert-fuelstations/GetClosestPlayers', JSON.stringify({}), function(players){
        if (players && players.found) {
          let htmlElement = '';
          $.each(players.players, function(k, v){
            htmlElement += '<div class="addon-menu-row"><div class="addon-menu-name"><i style="margin-right: 0.5vw;" class="fa-solid fa-user"></i> '+v.name+'</div><div class="addon-menu-transfer-button" data-plyid = "'+v.id+'">'+LANG.addon_menu_transfer_button+'</div></div>';
          });
          $('.addon-menu-mid').html(`
            <div class="addon-menu-mid">${htmlElement}</div>
          `);
        } else if (players && !players.found) {
          $('.addon-menu-mid').html(`
            <div class="addon-menu-mid"><div class="addon-menu-player-not-found">${LANG.addon_menu_player_not_found}</div></div>
          `);
        }
      });
    } else if (action == "newemployee") {
      $.post('https://wert-fuelstations/GetClosestPlayers', JSON.stringify({}), function(players){
        if (players && players.found) {
          let htmlElement = '';
          $.each(players.players, function(k, v){
            htmlElement += '<div class="addon-menu-row"><div class="addon-menu-name"><i style="margin-right: 0.5vw;" class="fa-solid fa-user"></i> '+v.name+'</div><div class="addon-menu-newemployee-button" data-plyid = "'+v.id+'">'+LANG.employes_add_employee+'</div></div>';
          });
          $('.addon-menu-mid').html(`
            <div class="addon-menu-mid">${htmlElement}</div>
          `);
        } else if (players && !players.found) {
          $('.addon-menu-mid').html(`
            <div class="addon-menu-mid"><div class="addon-menu-player-not-found">${LANG.addon_menu_player_not_found}</div></div>
          `);
        }
      });
    }
    
  }
}

function CloseAllUi(post) {
  if (addon_open) {
    addon_open = false;
    $('#addon-menu').css('display', 'none');
    $('.addon-menu-mid').html('');
  }

  if (ui_open) {
    ui_open = false;
    $('.control-panel-slide-menu').fadeOut();
    $('.control-panel').css('display', 'none');
  }

  if (buy_menu) {
    buy_menu = false;
    $('.open-buy-menu').css('display', 'none');
  }

  if (confirm_menu) {
    confirm_menu = false;
    $('.confirm-menu').css('display', 'none');
  }

  if (truck_shop_open) {
    truck_shop_open = false;
    $('.truck-shop').css('display', 'none');
    $('.truck-shop-mid').html('<div class="truck-shop-mid-cars"></div>');
  }

  if (post && !fuel_progress_bar_open) {$.post('https://wert-fuelstations/Close', JSON.stringify({}));}
}

function OpenBuyMenu(data) {
  if (!buy_menu) {
    buy_menu = true;
    $('.open-buy-menu').css('display', 'block');
    $('.open-buy-menu').html(`
      <div class="open-buy-menu-top">
        <div class="open-buy-menu-top-header"><i style="margin-right: 0.5vh; color: rgb(241, 49, 49);" class="fa-solid fa-gas-pump"></i> ${LANG.buy_menu_fuel_station} #${data.station}</div>
        <div class="close-buy-menu">X</div>
      </div>
      <div class="open-buy-menu-mid">
        <div id="buy-menu-item" class="open-buy-menu-mid-price"><i style="margin-right: 0.5vh;" class="fa-solid fa-comment-dollar"></i> ${LANG.buy_menu_fuel_station_price}${data.price}$</div>
        <div id="buy-menu-item" class="open-buy-menu-fuel-level"><i style="margin-right: 0.6vh; color: #f37f49; margin-left: 0.2vh;" class="fa-solid fa-droplet"></i> ${LANG.buy_menu_fuel_station_current_fuel}${data.fuel} Lt</div>
        <div id="buy-menu-item" class="open-buy-menu-buy-info"><i style="margin-right: 0.5vh; color: #77a6ec;" class="fa-solid fa-circle-info"></i> ${LANG.buy_menu_buy_info}</div>
      </div>
      <div class="open-buy-menu-buy-button" data-station="${data.station}"><i class="fa-solid fa-hand-holding-dollar"></i> ${LANG.buy_menu_buy_button}</div>
    `)
  }
}

function BuyMenuSecondMenu(station) {
  if (buy_menu) {
    $('.open-buy-menu').html(`
      <div class="open-buy-menu-top">
        <div class="open-buy-menu-top-header"><i style="margin-right: 0.5vh; color: rgb(51, 190, 86);" class="fa-solid fa-dollar-sign"></i> ${LANG.buy_menu_buy_second_header}</div>
        <div class="close-buy-menu">X</div>
      </div>
      <div class="open-buy-menu-mid">
        <div id="buy-menu-item" class="open-buy-menu-buy-info"><i style="margin-right: 0.5vh; color: #77a6ec;" class="fa-solid fa-circle-info"></i> ${LANG.buy_menu_buy_second_info}</div>
        <div class="open-buy-menu-mid-flex">
          <div class="open-buy-buy-confirm" data-station="${station}"><i class="fa-solid fa-check"></i> ${LANG.buy_menu_buy_second_button}</div>
          <div class="open-buy-buy-cancel"><i class="fa-solid fa-xmark"></i> ${LANG.buy_menu_buy_second_cancel}</div>
        </div>
      </div>
    `)
  }
}

function ManageMenuHomePage(info) {
  let employeelement = '';
  currentmenu = "mainmenu";
  var one = info.fuelsettings.fuel * 100
  var two = one / info.fuel_limit
  if (two > 100) {two = 100;}
  $('.fuel-in-level').css('height', two+'%')
  if (info.label != undefined && info.label != null) {
    $('.control-panel-station-name').html(info.label);
  } else {
    $('.control-panel-station-name').html(LANG.default_fuel_station_blip_label);
  }
  
  let statu_css = 'green';
  let statu_lang = LANG.fuel_level_info_good;
  if (info.fuelsettings.fuel < 50000) {
    statu_css = 'orange';
    statu_lang = LANG.fuel_level_info_medium;
  }
  if (info.fuelsettings.fuel < 25000) {
    statu_css = 'red';
    statu_lang = LANG.fuel_level_info_low;
  }

  $('.control-panel-fuel-mid-info').html(`
    <div class="control-panel-fuel-row">${LANG.fuel_total} : ${info.fuelsettings.fuel} Lt</div>
    <div class="control-panel-fuel-row">${LANG.fuel_fullness} : ${two}%</div>
    <div class="control-panel-fuel-statu" style="background: ${statu_css};">${statu_lang}</div>
  `)
  for (let i = 0; i < info.employess.length; i++) {
    employeelement += '<div class="control-panel-other-mid-emp-row"><i style="margin-right: 1vh;" class="fa-solid fa-user"></i>'+info.employess[i].name+'<i style="color: green; float: right;" class="fa-solid fa-check-double"></i></div>'
  }
  if (employeelement == '') {
    employeelement = '<div class="emp-not-found"><i class="fa-regular fa-face-frown"></i> No active employees found</div>';
  }
  var conv_money = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(info.money);
  $('.control-panel-other-mid').html(`
    <div class="control-panel-other-mid-employes">
      <div class="control-panel-other-mid-employe-header">${LANG.main_menu_active_employess_header}</div>
      <div class="control-panel-other-mid-emp-users">${employeelement}</div>
    </div>
    <div class="control-panel-other-mid-last">
      <div class="control-panel-other-mid-case-header">${LANG.main_menu_case_header}</div>
      <div class="control-panel-other-mid-case-menu">
        <div class="control-panel-other-mid-case-amount">${conv_money}</div>
      </div>
      <div class="other-price-line"></div>
      <div class="control-panel-other-mid-current-price">${LANG.main_menu_current_price}</div>
      <div class="control-panel-other-mid-current-price-row">
        <div class="control-panel-other-mid-current-price-text">${info.fuelsettings.price}.0</div>
      </div>
    </div>
  `);
}

function ManageMenuEmployeePage(info) {
  currentmenu = "employeemenu";
  let employeelement = '';
  for (let i = 0; i < info.employess.length; i++) {
    var rankname = '';
    let ply_rank = info.employess[i].rank;
    if (ply_rank == 1) {
      rankname = LANG.rank_worker;
    } else if (ply_rank == 2) {
      rankname = LANG.rank_manager;
    } else if (ply_rank == 3) {
      rankname = LANG.rank_owner;
    }
    employeelement += '<div class="control-panel-other-mid-manage-employes-row" data-citizenid="'+info.employess[i].citizenid+'" data-rank="'+ply_rank+'"><i style="color: green; padding-top: 1vh;" class="fa-solid fa-circle"></i><div class="manage-emp-name">'+info.employess[i].name+'</div><div class="manage-emp-rank">'+rankname+'</div><div class="manage-emp-rankup"><i class="fa-solid fa-chevron-up"></i> '+LANG.employes_page_rank_up+'</div><div class="manage-emp-rankdown"><i class="fa-solid fa-chevron-down"></i> '+LANG.employes_page_rank_down+'</div><div class="manage-emp-fire"><i class="fa-solid fa-xmark"></i> '+LANG.employes_page_rank_fire+'</div></div>'
  }
  if (employeelement == '') {
    employeelement = '<div class="emp-not-found"><i class="fa-regular fa-face-frown"></i> No active employees found</div>';
  }
  $('.control-panel-other-mid').html(`
    <div class="control-panel-other-mid-manage-employes">
      <div class="add-new-employee"><i class="fa-solid fa-plus"></i> ${LANG.employes_new_employee}</div>
      <div class="control-panel-other-mid-manage-employes-header">${LANG.emloyes_page_manage_header}</div>
      ${employeelement}
    </div>
  `);
}

function ManageMenuCasePage(info) {
  currentmenu = "casemenu";
  var conv_money = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(info.money);
  $('.control-panel-other-mid').html(`
    <div class="control-panel-other-mid-manage-company-case">
      <div class="control-panel-other-mid-manage-company-case-header">${LANG.manage_company_case_header}</div>
      <div class="control-panel-other-mid-manage-company-case-current-balance">${conv_money}</div>
      <input id="control-panel-other-mid-manage-company-case-input" type="number" min="0" placeholder="${LANG.manage_company_case_input_placeholder}">
      <div class="control-panel-other-mid-manage-company-money-action-buttons">
        <div class="manage-company-withdraw"><i class="fa-solid fa-money-bill-wave"></i> ${LANG.manage_company_case_withdraw}</div>
        <div class="manage-company-deposit"><i class="fa-solid fa-file-invoice-dollar"></i> ${LANG.manage_company_case_deposit}</div>
      </div>
      <div class="control-panel-other-mid-manage-company-bottom">
        <div class="manage-company-chart">
          <canvas id="myChart" class="testgrafik" width="423" height="230" style="width: 423px; height: 230px;"></canvas>
        </div>
        <div class="manage-company-chart-label">${LANG.manage_company_case_chart_label}</div>
      </div>
    </div>
  `);
  var grafiksayidata = undefined;
  var grafiktarihdata = undefined;
  var xValues = ["17.08.2023", "18.08.2023", "19.08.2023", "20.08.2023", "21.08.2023"];
  var yValues = [0, 0, 0, 0, 0];
  var grafikmin = 0;
  var grafikmax = 500;

  if (info.logs != undefined && info.logs != null) {
    info.logs.reverse();
    if (info.logs.length > 0) {
      grafiksayidata = [];
      grafiktarihdata = [];
    }
   
    let calc = 1;
    for (let i = 0; i < info.logs.length; i++) {
      if (calc < 5) {
        grafiksayidata.unshift(info.logs[i].money);
        grafiktarihdata.unshift(info.logs[i].date);
        calc = calc + 1;
      }
    }
  }

  if (grafiksayidata != undefined) {
    yValues = grafiksayidata;
    grafikmin = Math.min(...grafiksayidata);
    grafikmax = Math.max(...grafiksayidata);
  }

  if (grafiktarihdata != undefined) {
    xValues = grafiktarihdata;
  }
  new Chart("myChart", {
    type: "line",
    data: {
      labels: xValues,
      datasets: [{
        fill: false,
        lineTension: 0,
        backgroundColor: "#47f1aa",
        borderColor: "#47f1aa",
        data: yValues
      }]
    },
    options: {
      legend: {
        display: false,
        fontColor: "#ffffff",
        fillStyle: "#ffffff",
      },
      scales: {
        yAxes: [{ticks: {min: grafikmin, max:grafikmax}}],
      }
    },
  });
}

function ManageMenuCompanyPage(info) {
  currentmenu = "companysettings";
  $('.control-panel-other-mid').html(`
    <div class="control-panel-other-mid-company-settings">
      <div class="control-panel-other-mid-manage-company-settings-header">${LANG.company_page_header}</div>
      <div class="company-settings-change-name-information"><i class="fa-solid fa-circle-info"></i> ${LANG.company_change_label_info}</div>
      <div class="company-settings-row">
        <input id="control-panel-other-mid-manage-company-settings-name-input" type="text" min="0" placeholder="${LANG.company_change_label_placeholder}">
        <div class="company-settings-change-name"><i class="fa-solid fa-check"></i></div>
      </div>
      <div class="company-settings-change-sell-information"><i class="fa-solid fa-circle-info"></i> ${LANG.company_sell_or_transfer_info}</div>
      <div class="company-settings-row">
        <div class="company-settings-sell"><i class="fa-solid fa-hand-holding-dollar"></i> ${LANG.company_sell_button}</div>
        <div class="company-settings-transfer"><i class="fa-solid fa-right-left"></i> ${LANG.company_transfer_button}</div>
      </div>
      <div class="company-settings-change-sell-information"><i class="fa-solid fa-circle-info"></i> ${LANG.company_fire_all_emp_info}</div>
      <div class="company-settings-row">
        <div class="company-settings-fire-all-employess"><i class="fa-solid fa-user-xmark"></i> ${LANG.company_fire_all_button}</div>
      </div>
    </div>
  `);
}

function ManageMenuFuelPage(info) {
  currentmenu = "fuelsettings";
  // Stop, start selling ayarla
  let start_stop_element = '';
  if (info.fuelsettings.status == 1) {
    start_stop_element = '<div class="fuel-settings-set-status"><i class="fa-solid fa-circle-dot"></i> '+LANG.fuel_settings_stop_selling+'</div>';
  } else {
    start_stop_element = '<div class="fuel-settings-set-status" style="background:#65a765;"><i class="fa-solid fa-circle-dot"></i> '+LANG.fuel_settings_start_selling+'</div>';
  }
  $('.control-panel-other-mid').html(`
    <div class="control-panel-other-mid-fuel-settings">
      <div class="control-panel-other-mid-manage-fuel-settings-header">${LANG.fuel_settings_page_header}</div>
      <div class="company-settings-change-name-information"><i class="fa-solid fa-circle-info"></i> ${LANG.fuel_settings_page_price_edit_info}</div>
      <div class="company-settings-row">
        <input id="control-panel-other-mid-manage-fuel-settings-price-input" type="number" min="0" placeholder="${LANG.fuel_settings_price_edit_placeholder}">
        <div class="fuel-settings-set-new-price"><i class="fa-solid fa-check"></i></div>
      </div>
      <div class="company-settings-change-sell-information"><i class="fa-solid fa-circle-info"></i> ${LANG.fuel_settings_stop_start_fuel_selling_info}</div>
      <div class="company-settings-row">${start_stop_element}</div>
      <div class="company-settings-change-sell-information"><i class="fa-solid fa-circle-info"></i> ${LANG.fuel_settings_current_price}</div>
      <div class="fuel-settings-last-current">
        <div class="control-panel-other-mid-current-price-row">
          <div class="control-panel-other-mid-current-price-text">${info.fuelsettings.price}.0</div>
        </div>
      </div>
    </div>
  `);
}

function handleChange(e) {
  const checked = e.target;
  if (salary_status > 0) {
    salary_status = 0;
  } else {
    salary_status = 1;
  }
  AddNotif('<i class="fa-solid fa-circle-check"></i>', LANG.ui_salary_status_updated, "rgb(42 183 85)");
  $.post('https://wert-fuelstations/UpdateSalary', JSON.stringify({type:"active", value: salary_status}), function(success){});
}

function ManageMenuSalaryPage(info) {
  currentmenu = "salarysettings";
  let checkboxhtml = '';
  let selecthtml = '';
  if (info.salary.active > 0) {
    salary_status = 1;
    checkboxhtml = '<input class="numberrec-box" type="checkbox" onchange="handleChange(event)" checked>';
  } else {
    salary_status = 0;
    checkboxhtml = '<input class="numberrec-box" type="checkbox" onchange="handleChange(event)">';
  }
  $.each(info.salary.ranks, function(k, v){
    var rankname = '';
    var calcone = k+1;
    if (calcone == 1) {
      rankname = LANG.rank_worker;
    } else if (calcone == 2) {
      rankname = LANG.rank_manager;
    } else if (calcone == 3) {
      rankname = LANG.rank_owner;
    }
    var selectid = calcone + '' + rankname;
    selecthtml += '<option value="'+selectid+'">'+rankname+' - '+v+'$</option>'
  });
  $('.control-panel-other-mid').html(`
    <div class="control-panel-other-mid-manage-salary-system">
      <div class="control-panel-other-mid-manage-salary-settings-header">${LANG.salary_page_header}</div>
      <div class="company-settings-change-name-information"><i class="fa-solid fa-circle-info"></i> ${LANG.salary_page_on_off_system_info}</div>
      <div class="company-settings-row">
        <div class="companysettings-salary-close"><i class="fa-solid fa-square-xmark"></i> ${LANG.salary_system_close}</div>
        <div class="companysettings-salary-open"><i class="fa-solid fa-square-check"></i> ${LANG.salary_system_open}</div>
        <label class="switch">
          ${checkboxhtml}
          <span class="slider round"></span>
        </label>
      </div>
      <div class="company-settings-change-sell-information"><i class="fa-solid fa-circle-info"></i> ${LANG.salary_system_minute_info}</div>
      <div class="company-settings-row">
        <input id="control-panel-other-mid-salary-settings-minute-input" type="number" min="0" placeholder="${LANG.salary_system_minute_placeholder}${info.salary.payminute})">
        <div class="salary-settings-set-new-minute"><i class="fa-solid fa-check"></i></div>
      </div>
      <div class="company-settings-change-sell-information"><i class="fa-solid fa-circle-info"></i> ${LANG.salary_system_edit_salaries_info}</div>
      <div class="company-settings-row">
        <select name="salary-ranks" id="salary-ranks">${selecthtml}</select>
        <input id="salary-set-rank-price" type="number" min="0" placeholder="${LANG.salary_system_new_salary_placeholder}">
        <div class="salary-set-new-salary"><i class="fa-solid fa-check"></i></div>
      </div>
    </div>
  `);
}

function AddNotif(icon, text, color, truckshop) {
  if (truckshop != undefined && truckshop != null) {
    $('.truck-shop-notif-title').html(LANG.truck_shop_notif_title);
    $('.truck-shop-notif-icon').html(icon);
    $('.truck-shop-notif-text').html(text);
    $('.truck-shop-notification').css({"background":color})
    $('.truck-shop-notification').fadeIn(1000).css({"display":"block"});
    if (notiftimeout != undefined && notiftimeout != null) {
      clearTimeout(notiftimeout);
      notiftimeout = undefined;
    }
    notiftimeout = setTimeout(function(){
      $('.truck-shop-notification').fadeOut();
      notiftimeout = null;
    }, 2000);
  } else {
    $('.control-panel-notif-title').html(LANG.ui_notif_title);
    $('.control-panel-notif-icon').html(icon);
    $('.control-panel-notif-text').html(text);
    $('.control-panel-notification').css({"background":color})
    $('.control-panel-notification').fadeIn(1000).css({"display":"block"});
    if (notiftimeout != undefined && notiftimeout != null) {
      clearTimeout(notiftimeout);
      notiftimeout = undefined;
    }
    notiftimeout = setTimeout(function(){
      $('.control-panel-notification').fadeOut();
      notiftimeout = null;
    }, 2000);
  }
  
}

$(document).ready(function(){
  window.addEventListener('message', function(event) {
    switch(event.data.action) {
      case "OpenManageMenu":
        AccessData = event.data.AccessData;
        if (!ui_open) {
          ui_open = true;
          $('.control-panel').css('display', 'block');
          ManageMenuHomePage(event.data.info);
        }
        break;
      case "UpdateLang":
        LANG = event.data.lang;
        $('.control-panel-fuel-header').html(LANG.fuel_header);

        $('.control-panel-slide-menu').html(`
          <div class="control-slide-menu-top">
          <div class="control-slide-menu-top-text">${LANG.slide_menu_label}</div>
          <i id="close-slide-menu" class="fa-solid fa-arrow-left"></i>
          </div>
          <div class="control-panel-slide-menu-row" data-action="mainmenu"><i style="width: 3.6vh;" class="fa-solid fa-house"></i>${LANG.slide_main_menu}</div>
          <div class="control-panel-slide-menu-row" data-action="employeemenu"><i style="width: 3vh;" class="fa-solid fa-users"></i> ${LANG.slide_manage_employess}</div>
          <div class="control-panel-slide-menu-row" data-action="casemenu"><i style="width: 3vh;" class="fa-solid fa-hand-holding-dollar"></i> ${LANG.slide_manage_company_case}</div>
          <div class="control-panel-slide-menu-row" data-action="companysettings"><i style="width: 3.5vh;" class="fa-solid fa-gears"></i>${LANG.slide_company_settings}</div>
          <div class="control-panel-slide-menu-row" data-action="fuelsettings"><i style="width: 3.6vh;" class="fa-solid fa-droplet"></i>${LANG.slide_fuel_settings}</div>
          <div class="control-panel-slide-menu-row" data-action="salarysettings"><i style="width: 3.6vh;" class="fa-solid fa-wallet"></i>${LANG.slide_manage_salary_system}</div>
        `);
        break;
      case "UiNotif":
        AddNotif(event.data.icon, event.data.text, event.data.color, event.data.truckshop);
        break;
      case "CloseAll":
        CloseAllUi(true);
        break;
      case "OpenBuyMenu":
        OpenBuyMenu(event.data.data);
        break;
      case "UpdateAccess":
        if (ui_open) {
          AccessData = event.data.AccessData;
        }
        break;
      case "TruckShop":
        OpenTruckShop(event.data.ShopData);
        break;
      case "TankerProgress":
        OpenTankerProgressBar(event.data.duration, event.data.type);
        break;
    }
  })
});

$(document).on('keydown', function() {
  switch(event.keyCode) {
    case 27: // ESCAPE
      CloseAllUi(true);
      break;
  }
});

$(document).on('click', '.control-panel-slide-icon', function(e){
  e.preventDefault();
  $('.control-panel-slide-menu').fadeIn();
});

$(document).on('click', '#close-slide-menu', function(e){
  e.preventDefault();
  $('.control-panel-slide-menu').fadeOut();
});

$(document).on('click', '.close-all', function(e){
  e.preventDefault();
  CloseAllUi(true);
});

$(document).on('click', '.close-buy-menu', function(e){
  e.preventDefault();
  CloseAllUi(true);
});

$(document).on('click', '.main-menu', function(e){
  e.preventDefault();
  if (currentmenu == undefined || currentmenu != "mainmenu") {
    $('.control-panel-slide-menu').fadeOut();
    $.post('https://wert-fuelstations/GetPageData', JSON.stringify({}), function(info){
      if (info) {
        ManageMenuHomePage(info);
      }
    });
  }
});

$(document).on('click', '.refresh-page', function(e){
  e.preventDefault();
  if (currentmenu != undefined) {
    $.post('https://wert-fuelstations/GetPageData', JSON.stringify({}), function(info){
      if (info) {
        if (currentmenu == "mainmenu") {
          ManageMenuHomePage(info);
        } else if (currentmenu == "employeemenu") {
          ManageMenuEmployeePage(info);
        } else if (currentmenu == "casemenu") {
          ManageMenuCasePage(info);
        } else if (currentmenu == "companysettings") {
          ManageMenuCompanyPage(info);
        } else if (currentmenu == "fuelsettings") {
          ManageMenuFuelPage(info);
        } else if (currentmenu == "salarysettings") { 
          ManageMenuSalaryPage(info);
        }
      }
    });
  }
});

$(document).on('click', '.control-panel-slide-menu-row', function(e){
  e.preventDefault();
  let action = $(this).data('action');
  if (currentmenu != action) {
    $.post('https://wert-fuelstations/GetPageData', JSON.stringify({}), function(info){
      if (info) {
        if (action == "mainmenu") {
          ManageMenuHomePage(info);
        } else if (action == "employeemenu") {
          let access = CheckAccess("ManageEmploessAccess");
          if (access) {
            ManageMenuEmployeePage(info);
          } else {
            AddNotif('<i class="fa-solid fa-circle-xmark"></i>', LANG.open_menu_access_error, "rgb(183 42 42)");
          }
        } else if (action == "casemenu") {
          let access = CheckAccess("ManageCompanyCaseAccess");
          if (access) {
            ManageMenuCasePage(info);
          } else {
            AddNotif('<i class="fa-solid fa-circle-xmark"></i>', LANG.open_menu_access_error, "rgb(183 42 42)");
          }
        } else if (action == "companysettings") {
          let access = CheckAccess("CompanySettingsAccess");
          if (access) {
            ManageMenuCompanyPage(info);
          } else {
            AddNotif('<i class="fa-solid fa-circle-xmark"></i>', LANG.open_menu_access_error, "rgb(183 42 42)");
          }
        } else if (action == "fuelsettings") {
          let access = CheckAccess("FuelSettingsAccess");
          if (access) {
            ManageMenuFuelPage(info);
          } else {
            AddNotif('<i class="fa-solid fa-circle-xmark"></i>', LANG.open_menu_access_error, "rgb(183 42 42)");
          }
        } else if (action == "salarysettings") { 
          let access = CheckAccess("ManageSalarySystemAccess");
          if (access) {
            ManageMenuSalaryPage(info);
          } else {
            AddNotif('<i class="fa-solid fa-circle-xmark"></i>', LANG.open_menu_access_error, "rgb(183 42 42)");
          }
        }
      }
      /* if (info) {
        if (action == "mainmenu") {
          ManageMenuHomePage(info);
        } else if (action == "employeemenu") {
          ManageMenuEmployeePage(info);
        } else if (action == "casemenu") {
          ManageMenuCasePage(info);
        } else if (action == "companysettings") {
          ManageMenuCompanyPage(info);
        } else if (action == "fuelsettings") {
          ManageMenuFuelPage(info);
        } else if (action == "salarysettings") { 
          ManageMenuSalaryPage(info);
        }
      } */
    });
  }
});

// Withdraw

$(document).on('click', '.manage-company-withdraw', function(e){
  e.preventDefault();
  let money = $('#control-panel-other-mid-manage-company-case-input').val();
  if (money != undefined && money != "") {
    $('#control-panel-other-mid-manage-company-case-input').val("");
    $.post('https://wert-fuelstations/MoneyAction', JSON.stringify({type:"withdraw", money: money}), function(success, data){
      if (success) {
        AddNotif('<i class="fa-solid fa-circle-check"></i>', LANG.ui_withdraw_success, "rgb(42 183 85)");
        ManageMenuCasePage(success);
      }
    });
  } else {
    // Notif
    AddNotif('<i class="fa-solid fa-circle-xmark"></i>', LANG.ui_invalid_value, "rgb(183 42 42)");
  }
});

$(document).on('click', '.manage-company-deposit', function(e){
  e.preventDefault();
  let money = $('#control-panel-other-mid-manage-company-case-input').val();
  if (money != undefined && money != "") {
    $('#control-panel-other-mid-manage-company-case-input').val("");
    $.post('https://wert-fuelstations/MoneyAction', JSON.stringify({type:"deposit", money: money}), function(success){
      if (success) {
        AddNotif('<i class="fa-solid fa-circle-check"></i>', LANG.ui_deposit_success, "rgb(42 183 85)");
        ManageMenuCasePage(success);
      }
    });
  } else {
    // Notif
    AddNotif('<i class="fa-solid fa-circle-xmark"></i>', LANG.ui_invalid_value, "rgb(183 42 42)");
  }
});

$(document).on('click', '.fuel-settings-set-new-price', function(e){
  e.preventDefault();
  let newprice = $('#control-panel-other-mid-manage-fuel-settings-price-input').val();
  if (newprice != undefined && newprice != '') {
    $.post('https://wert-fuelstations/FuelSettings', JSON.stringify({action:"price", value: newprice}), function(success){
      if (success) {
        AddNotif('<i class="fa-solid fa-circle-check"></i>', LANG.ui_price_updated, "rgb(42 183 85)");
        ManageMenuFuelPage(success);
      }
    });
  } else {
    // Notif
    AddNotif('<i class="fa-solid fa-circle-xmark"></i>', LANG.ui_invalid_value, "rgb(183 42 42)");
  }
});

$(document).on('click', '.fuel-settings-set-status', function(e){
  e.preventDefault();
  $.post('https://wert-fuelstations/FuelSettings', JSON.stringify({action:"status", value: undefined}), function(success){
    if (success) {
      AddNotif('<i class="fa-solid fa-circle-check"></i>', LANG.ui_status_updated, "rgb(42 183 85)");
      ManageMenuFuelPage(success);
    }
  });
});

$(document).on('click', '.salary-settings-set-new-minute', function(e){
  e.preventDefault();
  let minute = $('#control-panel-other-mid-salary-settings-minute-input').val();
  if (minute != undefined && minute != "") {
    $('#control-panel-other-mid-salary-settings-minute-input').val("");
    $('#control-panel-other-mid-salary-settings-minute-input').attr('placeholder', LANG.salary_system_minute_placeholder+''+minute+')');
    AddNotif('<i class="fa-solid fa-circle-check"></i>', LANG.ui_salaries_updated, "rgb(42 183 85)");
    $.post('https://wert-fuelstations/UpdateSalary', JSON.stringify({type:"minute", value: minute}), function(success){});
  } else {
    // Notif
    AddNotif('<i class="fa-solid fa-circle-xmark"></i>', LANG.ui_invalid_value, "rgb(183 42 42)");
  }
});

$(document).on('click', '.salary-set-new-salary', function(e){
  e.preventDefault();
  let newprice = $('#salary-set-rank-price').val();
  let select = $('#salary-ranks').val();

  if (newprice != undefined && newprice != "") {
    let transtext = select.charAt(0);
    $.post('https://wert-fuelstations/UpdateSalary', JSON.stringify({type:"ranks", value: {
      rank: transtext,
      money: newprice,
    }}), function(success){
      if (success) {

        AddNotif('<i class="fa-solid fa-circle-check"></i>', LANG.ui_rank_salary_updated, "rgb(42 183 85)");
        ManageMenuSalaryPage(success);
      }
    });
  } else {
    AddNotif('<i class="fa-solid fa-circle-xmark"></i>', LANG.ui_invalid_value, "rgb(183 42 42)");
  }
});

$(document).on('click', '.company-settings-change-name', function(e){
  e.preventDefault();
  let newname = $('#control-panel-other-mid-manage-company-settings-name-input').val();
  if (newname != undefined && newname != "") {
    $('#control-panel-other-mid-manage-company-settings-name-input').val("");
    $('.control-panel-station-name').html(newname);
    AddNotif('<i class="fa-solid fa-circle-check"></i>', LANG.ui_company_name_updated, "rgb(42 183 85)");
    $.post('https://wert-fuelstations/UpdateCompany', JSON.stringify({type:"changename", value: newname}), function(success){});
  } else {
    AddNotif('<i class="fa-solid fa-circle-xmark"></i>', LANG.ui_invalid_value, "rgb(183 42 42)");
  }
});

$(document).on('click', '.company-settings-fire-all-employess', function(e){
  e.preventDefault();
  //AddNotif('<i class="fa-solid fa-circle-check"></i>', LANG.ui_all_employess_fired, "rgb(42 183 85)");
  $.post('https://wert-fuelstations/UpdateCompany', JSON.stringify({type:"fireallemployess", value: ""}), function(success){});
});

$(document).on('click', '.open-buy-menu-buy-button', function(e){
  e.preventDefault();
  let station = $(this).data('station');
  BuyMenuSecondMenu(station);
});

$(document).on('click', '.open-buy-buy-cancel', function(e){
  e.preventDefault();
  CloseAllUi(true);
});

$(document).on('click', '.open-buy-buy-confirm', function(e){
  e.preventDefault();
  let station = $(this).data('station');
  CloseAllUi(true);
  $.post('https://wert-fuelstations/BuyStation', JSON.stringify({station:station}), function(success){});
});

$(document).on('click', '.addon-menu-close', function(e){
  e.preventDefault();
  CloseAddonMenu();
});

$(document).on('click', '.company-settings-transfer', function(e){
  e.preventDefault();
  OpenAddonMenu("transfer");
});

$(document).on('click', '.addon-menu-transfer-button', function(e){
  e.preventDefault();
  let id = $(this).data('plyid');
  transfer_id = id;
  CloseAddonMenu();
  OpenConfirmMenu("transfer");
  //CloseAllUi(true);
  //$.post('https://wert-fuelstations/TransferStation', JSON.stringify({id:id}), function(success){});
});

$(document).on('click', '.confirm-menu-button-no', function(e){
  e.preventDefault();
  CloseConfirmMenu();
});

$(document).on('click', '.company-settings-sell', function(e){
  e.preventDefault();
  OpenConfirmMenu("sell");
});

$(document).on('click', '#sell-confirm-station', function(e){
  e.preventDefault();
  CloseAllUi(true);
  $.post('https://wert-fuelstations/SellStation', JSON.stringify({}), function(success){});
});


$(document).on('click', '#transfer-confirm-station', function(e){
  e.preventDefault();
  CloseAllUi(true);
  $.post('https://wert-fuelstations/TransferStation', JSON.stringify({id:transfer_id}), function(success){});
});

//add-new-employee
$(document).on('click', '.add-new-employee', function(e){
  e.preventDefault();
  OpenAddonMenu("newemployee");
});


$(document).on('click', '.addon-menu-newemployee-button', function(e){
  e.preventDefault();
  let id = $(this).data('plyid');
  CloseAddonMenu();
  $.post('https://wert-fuelstations/AddNewEmployee', JSON.stringify({id:id}), function(newdata){
    if (newdata) {
      ManageMenuEmployeePage(newdata);
    } else {
      AddNotif('<i class="fa-solid fa-circle-xmark"></i>', LANG.ui_invalid_value, "rgb(183 42 42)");
    }
  });
});

$(document).on('click', '.manage-emp-rankup', function(e){
  e.preventDefault();
  let citizenid = $(this).parent().data('citizenid');
  let rank = $(this).parent().data('rank');
  $.post('https://wert-fuelstations/UpdateEmployee', JSON.stringify({
    action:"rankup",
    value:{
      citizenid:citizenid,
      rank:rank
    },
  }), function(newdata){
    if (newdata) {
      ManageMenuEmployeePage(newdata);
    }
  });
});

$(document).on('click', '.manage-emp-rankdown', function(e){
  e.preventDefault();
  let citizenid = $(this).parent().data('citizenid');
  let rank = $(this).parent().data('rank');
  $.post('https://wert-fuelstations/UpdateEmployee', JSON.stringify({
    action:"rankdown",
    value:{
      citizenid:citizenid,
      rank:rank
    },
  }), function(newdata){
    if (newdata) {
      ManageMenuEmployeePage(newdata);
    }
  });
});

$(document).on('click', '.manage-emp-fire', function(e){
  e.preventDefault();
  let citizenid = $(this).parent().data('citizenid');
  $.post('https://wert-fuelstations/UpdateEmployee', JSON.stringify({
    action:"fire",
    value:citizenid
  }), function(newdata){
    if (newdata) {
      ManageMenuEmployeePage(newdata);
    }
  });
});

$(document).on('click', '.truck-shop-top-bar-close', function(e){
  e.preventDefault();
  CloseTruckShop(true)
});

$(document).on('click', '.truck-shop-top-bar-home', function(e){
  e.preventDefault();
  $('.truck-shop-mid').html('<div class="truck-shop-mid-cars"></div>');
  $.each(truck_shop_data, function(k, v){
    var conv_money = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(v.price);
    let htmlItem = `
      <div class="truck-shop-mid-cars-row">
        <div class="truck-shop-mid-cars-row-label">${v.label}</div>
        <img class="trucksellimage" src="${v.image}" alt="trucksellimage">
        <div class="truck-shop-mid-cars-row-bottom">
          <div class="truck-price">${conv_money}</div>
          <div class="truck-details" data-model="${v.model}">${LANG.truck_row_details}</div>
        </div>
      </div>
    `
    $('.truck-shop-mid-cars').append(htmlItem);
  });
});


$(document).on('click', '.truck-details', function(e){
  e.preventDefault();
  let model = $(this).data('model');
  let cardata = truck_shop_data[model];
  if (cardata != undefined && cardata != null) {
    $.post('https://wert-fuelstations/GetMyStations', JSON.stringify({}), function(newdata){
      let selectHtml = '';
      $.each(newdata, function(k, v){
        selectHtml += '<option value="'+v.no+'">'+v.label+'</option>';
      });
      $('.truck-shop-mid').html('<div class="truck-shop-mid-cars"></div>');
      var conv_money = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(cardata.price);
      let htmlItem = `
        <div class="truck-shop-details-label">${cardata.label}</div>
        <div class="truck-shop-detail-image"><img src="${cardata.image}" alt="trucksellimage"></div>
        <div class="truck-shop-detail-description">${LANG.truck_detail_description}</div>
        <div class="truck-shop-detail-price">${LANG.truck_detail_price_info} ${conv_money}</div>
        <div class="truck-shop-detail-buy-buttons">
          <select name="shop-stations" id="shop-stations">${selectHtml}</select>
          <div class="truck-shop-detail-buy" data-price="${cardata.price}" data-model="${model}"><i class="fa-solid fa-wallet"></i> ${LANG.truck_detail_buy}</div>
        </div>
        <div class="truck-shop-details-bottom-box">
          <div class="truck-shop-details-bottom-colors">
            <div class="truck-shop-details-bottom-colors-header">${LANG.truck_detail_select_color}</div>
            <div class="color" data-colorid="111" style="background: white;"></div>
            <div class="color" data-colorid="28" style="background: rgb(230, 79, 79);"></div>
            <div class="color" data-colorid="91" style="background: rgb(216, 214, 105);"></div>
            <div class="color" data-colorid="92" style="background: rgb(137, 224, 119);"></div>
            <div class="color" data-colorid="74" style="background: rgb(100, 173, 207);"></div>
            <div class="color" data-colorid="145" style="background: rgb(155, 80, 204);"></div>
            <div class="color" data-colorid="3" style="background: gray;"></div>
            <div class="color" data-colorid="27" style="background: rgb(223, 35, 35);"></div>
            <div class="color" data-colorid="38" style="background: rgb(204, 155, 50);"></div>
            <div class="color" data-colorid="53" style="background: rgb(50, 192, 137);"></div>
            <div class="color" data-colorid="70" style="background: rgb(48, 109, 179);"></div>
            <div class="color" data-colorid="72" style="background: rgb(128, 49, 180);"></div>
            <div class="color" data-colorid="0" style="background: black;"></div>
            <div class="color" data-colorid="32" style="background: rgb(134, 6, 6);"></div>
            <div class="color" data-colorid="36" style="background: rgb(204, 111, 5);"></div>
            <div class="color" data-colorid="50" style="background: rgb(4, 90, 26);"></div>
            <div class="color" data-colorid="73" style="background: rgb(5, 55, 190);"></div>
            <div class="color" data-colorid="71" style="background: rgb(100, 0, 167);"></div>
          </div>
          <div class="truck-shop-details-bottom-infos">
            <div class="truck-shop-details-bottom-infos-header">${LANG.truck_detail_statics}</div>
            <div class="truck-shop-details-bottom-infos-row">${LANG.truck_detail_statics_traction}</div>
            <div class="truck-shop-details-bottom-infos-row-bar">
              <div class="truck-shop-details-bottom-infos-row-bar-inline" style="width:`+Math.ceil(10*cardata.traction*1.6)+`%"></div>
            </div>
            <div class="truck-shop-details-bottom-infos-row">${LANG.truck_detail_statics_maxspeed}</div>
            <div class="truck-shop-details-bottom-infos-row-bar">
              <div class="truck-shop-details-bottom-infos-row-bar-inline" style="width:`+Math.ceil(cardata.topspeed*1.4)+`%"></div>
            </div>
            <div class="truck-shop-details-bottom-infos-row">${LANG.truck_detail_statics_acceleration}</div>
            <div class="truck-shop-details-bottom-infos-row-bar">
              <div class="truck-shop-details-bottom-infos-row-bar-inline" style="width:`+Math.ceil(100*cardata.acceleration)+`%"></div>
            </div>
            <div class="truck-shop-details-bottom-infos-row">${LANG.truck_detail_statics_breaking}</div>
            <div class="truck-shop-details-bottom-infos-row-bar">
              <div class="truck-shop-details-bottom-infos-row-bar-inline" style="width:`+Math.ceil(100*cardata.breaking)+`%"></div>
            </div>
          </div>
        </div>
      `
      $('.truck-shop-mid-cars').append(htmlItem);
    });
  }
  
});

$(document).on('click', '.color', function(e){
  e.preventDefault();
  let colorid = $(this).data('colorid');
  if (my_color_id == undefined) {
    my_color_id = colorid;
    last_color_element = this;
    $(last_color_element).css('border', '1px solid white');
    $(last_color_element).css('box-shadow', '0 0 20px white');
  } else {
    if (my_color_id == colorid) {
      my_color_id = undefined;
      $(last_color_element).css('border', '1px solid gray');
      $(last_color_element).css('box-shadow', 'none');
      last_color_element = undefined;
    } else if (my_color_id != colorid) {
      my_color_id = colorid;
      $(last_color_element).css('border', '1px solid gray');
      $(last_color_element).css('box-shadow', 'none');
      last_color_element = this;
      $(last_color_element).css('border', '1px solid white');
      $(last_color_element).css('box-shadow', '0 0 20px white');
    }
  }
});

$(document).on('click', '.truck-shop-detail-buy', function(e){
  let price = $(this).data('price');
  let model = $(this).data('model');
  let select = $('#shop-stations').val();
  $.post('https://wert-fuelstations/BuyTruck', JSON.stringify({model:model, price:price, station:select, color:my_color_id}), function(success){});
});