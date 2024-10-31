$("#ui").hide();
$("#applyUI").hide();

var candidates = [];

const RECORDS_PER_PAGE = 4;
var currentPage = 1;
var chosenCandidateName = "";
var chosenCandidateID = 0;

addEventListener("message", async function (event) {
  var eventData = event.data;

  if (eventData.type == "show") {
    await getCandidatesData();
    showUI();
  } else if (eventData.type == "showCandidatesApp") {
    $("#applyUI").show();
  } else if (poy.type == "close") {
    closeUI();
  }
});

async function getCandidatesData() {
  await $.post(
    `https://${GetParentResourceName()}/getCandidate`,
    JSON.stringify({}),
    function (candidatesInfo) {
      candidatesInfo.forEach((candidateInfo) => {
        candidates.push({
          citizen: candidateInfo.identifier,
          name: candidateInfo.name,
          age: candidateInfo.age,
          shortDescription: candidateInfo.shortDescription,
          whyDoYouWantToBeACandidate: candidateInfo.whyDoYouWantToBeACandidate,
          WhatYoullBringToTheCity: candidateInfo.WhatYoullBringToTheCity,
        });
      });
    }
  );
}

function changePage(page) {
  const nextBtn = document.getElementById("nextBtn");
  const prevBtn = document.getElementById("prevBtn");
  const candidatesDiv = document.getElementById("candidates");

  prevBtn.style.display = "none";
  nextBtn.style.display = "none";

  if (page < 1) page = 1;
  if (page > numPages()) page = numPages();

  candidatesDiv.innerHTML = "";

  for (
    var i = (page - 1) * RECORDS_PER_PAGE;
    i < page * RECORDS_PER_PAGE && i < candidates.length;
    i++
  ) {
    candidatesDiv.innerHTML += `
        <div class="drop-shadow-lg flex flex-row mb-3 justify-between items-center w-[522px] h-min bg-[#324694]/80 rounded-lg text-white font-semibold">
            <div class="m-2">
                <h1>${candidates[i].name}, <span>${candidates[i].age}</span></h1>
                <p class="mt-2 text-[#e3e3e3] w-96">${candidates[i].shortDescription}</p>
            </div>
            <div class="mr-3">
                <a href="javascript:openCandidatePage(${i})" id="viewBtn" class="inline-flex items-center py-2 px-4 text-sm font-medium text-white bg-[#1836ad]/80 border border-solid border-slate-800 rounded-lg border border-gray-300 hover:bg-[#524866] hover:text-white">
                    View
                    <svg aria-hidden="true" class="ml-2 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                </a>
            </div>
        </div>
    `;
  }

  if (candidates.length <= 4) {
    prevBtn.style.display = "none";
    nextBtn.style.display = "none";
  } else {
    if (page > 1 && page < numPages()) {
      prevBtn.style.display = "flex";
      nextBtn.style.display = "flex";
    } else if (page === 1) {
      prevBtn.style.display = "none";
      nextBtn.style.display = "flex";
    } else if (page === numPages()) {
      prevBtn.style.display = "flex";
      nextBtn.style.display = "none";
    }
  }
}

function numPages() {
  return Math.ceil(candidates.length / RECORDS_PER_PAGE);
}

function prevPage() {
  if (currentPage > 1) {
    currentPage--;
    changePage(currentPage);
  }
}

function nextPage() {
  if (currentPage < numPages()) {
    currentPage++;
    changePage(currentPage);
  }
}

function getSelectItem() {
  chosenCandidateName = candidates[chosenCandidateID].name;

  document.getElementById("candidatePage").style.display = "none";
  document.getElementById("pageBtnsGroup").style.display = "none";

  document.getElementById("beforeSubmittingText").style.display = "block";
  document.getElementById("submitBtnsGroup").style.display = "flex";

  document.getElementById("yourVote").style.display = "block";

  document.getElementById(
    "yourVote"
  ).innerText = `Your vote: ${chosenCandidateName} - Make sure its your right candidate!`;
}

function openCandidatePage(id) {
  document.getElementById("candidates").style.display = "none";
  document.getElementById("candidatesBtnsGroup").style.display = "none";

  chosenCandidateID = id;

  const {
    name,
    age,
    shortDescription,
    whyDoYouWantToBeACandidate,
    WhatYoullBringToTheCity,
  } = candidates[id];

  const header = document.getElementById("pageHeader");
  const paragraph = document.getElementById("pageP");

  header.innerHTML = `${name}, <span>${age}</span><br />${shortDescription}`;
  paragraph.innerHTML = `
    Why you want to be a candidate?
    <span class="text-[grey]"><br>${whyDoYouWantToBeACandidate}</span><br />
    What you'll bring to the city?
    <span class="text-[grey]"><br>${WhatYoullBringToTheCity}</span>
    `;

  document.getElementById("candidatePage").style.display = "block";
  document.getElementById("pageBtnsGroup").style.display = "flex";
}

function goBackFromSubmit() {
  document.getElementById("candidates").style.display = "flex";
  document.getElementById("candidatesBtnsGroup").style.display = "flex";

  document.getElementById("candidatePage").style.display = "none";
  document.getElementById("pageBtnsGroup").style.display = "none";

  document.getElementById("beforeSubmittingText").style.display = "none";
  document.getElementById("submitBtnsGroup").style.display = "none";

  document.getElementById("yourVote").style.display = "none";

  changePage(1);
  currentPage = 1;
}

function goBackFromCandidatePage() {
  document.getElementById("candidates").style.display = "flex";
  document.getElementById("candidatesBtnsGroup").style.display = "flex";

  changePage(1);
  currentPage = 1;

  document.getElementById("pageBtnsGroup").style.display = "none";
  document.getElementById("candidatePage").style.display = "none";
}

function submit() {
  document.getElementById("beforeSubmittingText").style.display = "none";
  document.getElementById("submitBtnsGroup").style.display = "none";

  document.getElementById("afterSubmittingText").classList.remove("hidden");
  document.getElementById("afterSubmittingText").classList.add("flex");

  const { name } = candidates[chosenCandidateID];
  const { citizen } = candidates[chosenCandidateID];

  document.getElementById("yourVote").innerText = `Your vote: ${name}`;

  if (chosenCandidateName !== "") {
    $.post(`https://${GetParentResourceName()}/voteForSomeone`, JSON.stringify({ citizen }));

    setTimeout(function () {
      closeUI();
    }, 5000);
  } else {
    $.post(`https://${GetParentResourceName()}/error`);
  }

  setTimeout(function () {
    closeUI();
  }, 5000);
}

function closeUI() {
  candidates = [];

  currentPage = 1;
  chosenCandidateName = "";
  chosenCandidateID = 0;

  $.post(`https://${GetParentResourceName()}/close`);

  resetUI();
  $("#ui").hide();
}

function resetUI() {
  document.getElementById("afterSubmittingText").classList.remove("flex");
  document.getElementById("afterSubmittingText").classList.add("hidden");
  document.getElementById("beforeSubmittingText").style.display = "none";
  document.getElementById("submitBtnsGroup").style.display = "none";
  document.getElementById("candidates").style.display = "flex";
  document.getElementById("candidatesBtnsGroup").style.display = "flex";
  document.getElementById("pageBtnsGroup").style.display = "none";
  document.getElementById("candidatePage").style.display = "none";
}

document.onkeyup = function (event) {
  const charCode = event.key;
  if (charCode == "Escape") {
    closeUI();
    closeCandidateAppUI();
  }
};

function showUI() {
  $("#ui").show();
  changePage(1);
}

function clearInputs() {
  $("#firstQ").val("");
  $("#secondQ").val("");
  $("#thirdQ").val("");
}

$("#clearBtn").click(function () {
  return clearInputs();
});

$("#submitAppBtn").click(function () {
  let btnGroup = $("#applyAsCandidateBtnsGroup");
  let questionsDiv = $("#questions");

  let q1El = $("#firstQ");
  let q2El = $("#secondQ");
  let q3El = $("#thirdQ");

  let q1Label = $("#q1Label");
  let q2Label = $("#q2Label");
  let q3Label = $("#q3Label");

  let q1Val = $.trim(q1El.val());
  let q2Val = $.trim(q2El.val());
  let q3Val = $.trim(q3El.val());

  let q1Len = getWordCount(q1Val);
  let q2Len = getWordCount(q2Val);
  let q3Len = getWordCount(q3Val);

  if (q1Len > 200 || 20 > q1Len) {
    q1El.addClass(
      "bg-red-50 border border-red-500 text-red-900 placeholder-red-700"
    );
    q1Label.addClass("text-red-900");

    return q1El.val("");
  } else {
    q1El.addClass("bg-green-50 border border-green-500 text-green-900");
    q1Label.addClass("text-green-700");
  }

  if (q2Len > 500 || 30 > q2Len) {
    q2El.addClass(
      "bg-red-50 border border-red-500 text-red-900 placeholder-red-700"
    );
    q2Label.addClass("text-red-900");

    return q2El.val("");
  } else {
    q2El.addClass("bg-green-50 border border-green-500 text-green-900");
    q2Label.addClass("text-green-700");
  }

  if (q3Len > 500 || 30 > q3Len) {
    q3El.addClass(
      "bg-red-50 border border-red-500 text-red-900 placeholder-red-700"
    );
    q3Label.addClass("text-red-900");

    return q3El.val("");
  } else {
    q3El.addClass("bg-green-50 border border-green-500 text-green-900");
    q3Label.addClass("text-green-700");
  }

  btnGroup.hide();

  questionsDiv.hide();

  $("#afterSubmittingApplicationText").removeClass("hidden");

  returnApplicationData(q1Val, q2Val, q3Val);
  closeCandidateAppUI();
});

function returnApplicationData(q1, q2, q3) {
  return $.post(
    `https://${GetParentResourceName()}/submitCandidateApplication`,
    JSON.stringify({ q1, q2, q3 })
  );
}

function getWordCount(str) {
  return str.split(" ").length;
}

function closeCandidateAppUI() {
  $.post(`https://${GetParentResourceName()}/close`);

  resetAppUI();
  $("#applyUI").hide();
}

function resetAppUI() {
  let btnGroup = $("#applyAsCandidateBtnsGroup");
  let questionsDiv = $("#questions");

  $("#afterSubmittingApplicationText").addClass("hidden");
}
