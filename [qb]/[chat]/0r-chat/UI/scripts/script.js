const isEnvBrowser = () => !window.invokeNative;
let showingSettingsMenu = false;
let notificationsEnabled = true;
let showingEmojiMenu = false;
let showingChatInput = false;
let enableEmojiMenu = true;
let oocMessageWithoutCommand = false;
let boxTimeout = null;
let showingUsedCommand = 0;
let commandList = [];
let commandSugestions = [];
let usedCommands = [];
let defaultSuggestions = [];
let chatStyleVersion =
  localStorage.getItem("chatStyle") ||
  (() => {
    localStorage.setItem("chatStyle", "v3");
    return "v3";
  })();

const messages = [];
const suggestionTemplate = `<div data-id="$id" onclick="suggestionClicked('$id')" class="suggestion">$content</div>`;
const messageTemplates = [
  `
  <div class="message" id="v1">
      <div class="message-top">
          <div class="message-top-left">
            <div style="color: $typeColor;background-color: $typeBgColor;border-color: $typeColor;" class="message-type">$type</div>
            <div class="message-header">$header</div>
          </div>
          <div class="message-time">$time</div>
      </div>
      <div class="message-bottom">
          $content
      </div>
  </div>
 `,
  `
  <div class="message" id="v2">
      <div class="message-container">
        <div class="message-time">$time</div>
        <div class="message-type" style="color: $typeColor">$type</div>
        <div class="message-header" style="color: $typeColor">$header<span style="margin-right: 4px; margin-left: 4px">:</span></div>
        <div class="message-content" style="color: $typeColor">$content</div>
      </div>
  </div>
 `,
  `
  <div class="message" id="v3">
      <div class="message-container">
        <div class="message-subcont">
          <div class="message-type" style="color: $typeColor;background-color: $typeBgColor;border-color: $typeColor;">$type</div>
          <div class="message-header">$header<span style="margin-right: 4px; margin-left: 4px">:</span></div>
        </div>
        <div class="message-content">$content</div>
        <div class="message-time">$time</div>
      </div>
  </div>
 `,
];
const getTime = () => {
  let date = new Date();
  let hour =
    date.getHours().toString().length == 1
      ? `0${date.getHours()}`
      : date.getHours();
  let minute =
    date.getMinutes().toString().length == 1
      ? `0${date.getMinutes()}`
      : date.getMinutes();

  return `${hour}:${minute}`;
};

const parseText = (str) => {
  return str
    .replace(/(<([^>]+)>)/gi, "")
    .replace(
      /\^([0-9])/g,
      (str, color) => `</span><span class="chat-textColor-${color}">`
    )
    .replaceAll("\n", "<br/>");
};

const addMessage = (type, typeColor, typeBgColor, header, content, time) => {
  clearTimeout(boxTimeout);
  time = time || getTime();
  let index = 0;
  if (chatStyleVersion == "v2") index = 1;
  else if (chatStyleVersion == "v3") index = 2;
  $(".message-box .col").append(
    messageTemplates[index]
      .replaceAll("$typeColor", typeColor || "")
      .replaceAll("$typeBgColor", typeBgColor || "")
      .replaceAll("$type", type)
      .replaceAll("$header", header)
      .replaceAll("$content", parseText(content))
      .replaceAll("$time", time)
  );
  $(".message-box").animate(
    { scrollTop: $(".message-box")?.get(0)?.scrollHeight },
    400
  );
  messages.push({ type, header, content, time });
};

const clearMessages = () => {
  $(".message-box .col").children().remove();
};

const getSuggestionsOnScreen = () => {
  let suggestions = [];

  $(".suggestions")
    .children()
    .each((i) => {
      const suggestion = $(`.suggestions .suggestion:nth-child(${i + 1})`).attr(
        "data-id"
      );

      if (suggestion) suggestions.push(suggestion);
    });

  return suggestions;
};

const removeSuggestion = (suggestion) => {
  $(".suggestions")
    .children()
    .each((i) => {
      const suggestionId = $(
        `.suggestions .suggestion:nth-child(${i + 1})`
      ).attr("data-id");

      if (suggestionId == suggestion)
        $(`.suggestions .suggestion:nth-child(${i + 1})`).remove();
    });
};

const updateSuggestions = (newSuggestions) => {
  if (showingEmojiMenu) {
    hideSuggestions();
  } else showSuggestions();

  let suggestionsOnScreen = getSuggestionsOnScreen();

  suggestionsOnScreen.forEach((suggestionOnScreen) => {
    let shouldRemove = true;

    for (let i = 0; i < newSuggestions.length; i++) {
      if (newSuggestions[i].command == suggestionOnScreen) shouldRemove = false;
    }

    if (shouldRemove) removeSuggestion(suggestionOnScreen);
  });
  newSuggestions.reverse();
  newSuggestions.forEach((newSuggestion) => {
    let shouldAdd = true;

    for (let i = 0; i < suggestionsOnScreen.length; i++) {
      if (suggestionsOnScreen[i] == newSuggestion.command) shouldAdd = false;
    }

    if (shouldAdd)
      $(".suggestions").prepend(
        suggestionTemplate
          .replaceAll("$id", newSuggestion.command)
          .replaceAll("$content", newSuggestion.command)
          .replaceAll("$color", newSuggestion.color || "#")
      );
  });
};

const suggestionClicked = (suggestion) => {
  const commandSuggestion = commandSugestions.find(
    (x) => x.command == suggestion
  );

  if (commandSuggestion) {
    let text = `/${suggestion}`;

    commandSuggestion.args.forEach((arg) => {
      text += ` ${arg.name}`;
    });

    $("#chat-text-input").val(text);
  } else {
    $("#chat-text-input").val(`/${suggestion}`);
  }

  $("#chat-text-input").trigger("input");
};

const onTextInput = () => {
  const inputValue = $("#chat-text-input").val().trim();
  const suggestions = [];

  if (inputValue.slice(1).length == 0 || !inputValue.startsWith("/"))
    return updateSuggestions(defaultSuggestions);
  commandList.forEach((command) => {
    if (
      command.startsWith(inputValue.slice(1)) &&
      suggestions.filter((x) => x.command == command).length == 0
    ) {
      suggestions.push({
        command: command,
        color: "gray",
      });
    }
  });
  updateSuggestions(suggestions.slice(0, 10));
};

const showSuggestions = () => {
  if (showingEmojiMenu) return;

  $(".suggestions").css("visibility", "visible");
};
const hideSuggestions = () => {
  $(".suggestions").css("visibility", "hidden");
};

const showChatInput = (focus) => {
  showingChatInput = true;
  $("#chat-text-input").val("");
  $(".chat-input-part").css("display", "flex");
  $(".chat-buttons").css("display", "flex");
  if (focus) $("#chat-text-input").focus();
  showSuggestions();
  updateSuggestions(defaultSuggestions);
};

const hideChatInput = () => {
  $(".chat-input-part").css("display", "none");
  $(".chat-buttons").css("display", "none");
  hideSuggestions();
  showingChatInput = false;
};

const showChatBox = () => {
  $(".message-box").css("visibility", "visible");
};

const hideChatBox = (noAnim) => {
  if (noAnim) {
    $(".message-box").css("visibility", "hidden");
    return;
  }
  $(".message-box").animate({ opacity: 0 }, 250, () => {
    $(".message-box").css("visibility", "hidden");
    $(".message-box").css("opacity", "");
  });
};

const showUsedCommands = (forward) => {
  if (usedCommands.length > 0) {
    if (forward) showingUsedCommand--;
    else showingUsedCommand++;

    if (showingUsedCommand < 0) showingUsedCommand = usedCommands.length - 1;
    else if (showingUsedCommand >= usedCommands.length) showingUsedCommand = 0;

    const _input = $("#chat-text-input");
    const _value = usedCommands[showingUsedCommand];
    _input.focus().val(_value);
  }
};

const processInput = () => {
  const inputValue = $("#chat-text-input").val().trim();

  if (
    !inputValue.startsWith("/") &&
    inputValue.length >= 1 &&
    oocMessageWithoutCommand
  ) {
    $.post(
      `https://${GetParentResourceName()}/processInput`,
      JSON.stringify({
        command: `ooc ${inputValue}`,
      })
    );
    usedCommands.push(inputValue);
    $.post(`https://${GetParentResourceName()}/hide`);
    return;
  }

  if (inputValue.slice(1).length == 0 || !inputValue.startsWith("/")) {
    $.post(`https://${GetParentResourceName()}/hide`);
    return;
  }

  $.post(
    `https://${GetParentResourceName()}/processInput`,
    JSON.stringify({ command: inputValue.slice(1) })
  );

  usedCommands.push(`/${inputValue.slice(1)}`);

  $.post(`https://${GetParentResourceName()}/hide`);
};

const loadEmojiMenu = () => {
  if (!enableEmojiMenu) return;
  emojiList.forEach((emoji) => {
    $(".chat-emoji-menu").append(
      `<div class="emoji-menu-emoji" onclick="emojiClicked('${emoji}')">${emoji}<div/>`
    );
  });
};

const showEmojiMenu = () => {
  if (!enableEmojiMenu) return;
  hideSuggestions();
  $(".chat-emoji-menu").css("display", "flex");
  showingEmojiMenu = true;
};

const hideEmojiMenu = () => {
  $(".chat-emoji-menu").css("display", "none");
  showingEmojiMenu = false;
  showSuggestions();
};

const toggleEmojiMenu = () => {
  if ($(".chat-emoji-menu").css("display") == "none") {
    if ($(".chat-emoji-menu").children().length == 0) {
      loadEmojiMenu();
    }
    showEmojiMenu();
  } else hideEmojiMenu();
};

const emojiClicked = (emoji) => {
  const inputValue = $("#chat-text-input").val();
  $("#chat-text-input").val(`${inputValue}${emoji}`);
  $("#chat-text-input").trigger("input");
};

const toggleNotification = () => {
  if (notificationsEnabled) {
    notificationsEnabled = false;
    $("#notification img").attr("src", "img/bell-slash.png");
  } else {
    notificationsEnabled = true;
    $("#notification img").attr("src", "img/bell.png");
  }
};

const showSettingsMenu = () => {
  hideEmojiMenu();
  hideChatBox(true);
  hideChatInput();
  $(".settings-menu").css("display", "flex");
};

const hideSettingsMenu = () => {
  $(".settings-menu").css("display", "none");
};

const toggleSettingsMenu = (important) => {
  if (typeof important == "boolean") {
    showingSettingsMenu = important;
  } else {
    showingSettingsMenu = !showingSettingsMenu;
  }
  if (!isEnvBrowser()) {
    $.post(
      `https://${GetParentResourceName()}/toggleSettingsMenu`,
      JSON.stringify({
        status: showingSettingsMenu,
      })
    );
  } else {
    if (showingSettingsMenu) showSettingsMenu();
    else hideSettingsMenu();
  }
};

const onPositionChange = (event) => {
  const target = event.target;
  if (target.checked) {
    // right
    $(".container").addClass("toRight");
    $(".song").addClass("toLeft");
  } else {
    // left
    $(".container").removeClass("toRight");
    $(".song").removeClass("toLeft");
  }
};

window.addEventListener("message", ({ data }) => {
  if (!data) return;
  if (data?.commandList) commandList = data.commandList;
  if (data?.defaultSuggestions) defaultSuggestions = data.defaultSuggestions;
  if (data?.oocMessageWithoutCommand == true) oocMessageWithoutCommand = true;
  else if (data?.oocMessageWithoutCommand == false)
    oocMessageWithoutCommand = false;
  if (data?.enableEmojiMenu == true) {
    enableEmojiMenu = true;
    $(".chat-emoji").css("display", "flex");
  } else if (data?.enableEmojiMenu == false) {
    enableEmojiMenu = false;
    $(".chat-emoji").css("display", "none");
  }

  switch (data.action) {
    case "showChat":
      clearTimeout(boxTimeout);
      showChatInput(true);
      showChatBox();
      break;

    case "hideChat":
      hideChatInput();
      hideEmojiMenu();
      hideSuggestions();
      showingUsedCommand = null;

      boxTimeout = setTimeout(() => {
        if (!showingChatInput) hideChatBox();
      }, 3000);
      break;

    case "addMessage":
      if (data.message?.toString()?.startsWith("^1command")) {
        data.message = {
          type: data.message.type || "SYSTEM",
          typeColor: "#de4949",
          header: "ERROR",
          args: [
            data.message.replaceAll("^1command.", "").replaceAll("^0", ""),
          ],
          time: getTime(),
        };
      }

      if (data.message?.args?.join(" ")?.length >= 1) {
        addMessage(
          data.message.type || "COMMAND",
          data.message.color,
          data.message.bgColor,
          data.message.header || "Info",
          data.message.args.join(" "),
          data.message.time
        );

        if (notificationsEnabled) {
          showChatBox();
          boxTimeout = setTimeout(() => {
            if (!showingChatInput) hideChatBox();
          }, 5000);
        }
      }
      break;

    case "addSuggestion":
      if (
        commandSugestions.filter((x) => x.command == data.command).length == 0
      ) {
        commandSugestions.push({
          command: data.command,
          description: data.description,
          args: data.args,
        });
      }
      break;

    case "clear":
      clearMessages();
      break;
    case "toggleSettingsMenu":
      if (data.data) {
        showSettingsMenu();
      } else {
        hideSettingsMenu();
      }
      break;
    case "changeChatStyle":
      toggleSettingsMenu(false);
      if (chatStyleVersion === data.data) return;
      $.post(`https://${GetParentResourceName()}/hide`);
      clearMessages();
      chatStyleVersion = data.data;
      localStorage.setItem("chatStyle", data.data);
      $("div.container").attr("class", `container ${chatStyleVersion}`);
      break;
    case "setSongInfo":
      if (data.off) {
        $(".song").css("display", "none");
      } else {
        $.getJSON(
          "https://noembed.com/embed?url=",
          { format: "json", url: data.url },
          (result) => {
            $(".song").css("display", "flex");
            $(".song .song-title").text(result.title);
          }
        );
      }
      break;
  }
});

window.addEventListener("keydown", (event) => {
  const { key } = event;
  if (isEnvBrowser()) return;

  if (key == "Escape") {
    $.post(`https://${GetParentResourceName()}/hide`);
    if (showingSettingsMenu) {
      showingSettingsMenu = false;
      $.post(
        `https://${GetParentResourceName()}/toggleSettingsMenu`,
        JSON.stringify({
          status: showingSettingsMenu,
        })
      );
    }
  } else if (key == "Enter") {
    processInput();
  } else if (key == "ArrowUp") {
    event.preventDefault();
    showUsedCommands(true);
  } else if (key == "ArrowDown") {
    event.preventDefault();
    showUsedCommands(false);
  }
});

$(document).ready(() => {
  $("#chat-text-input").on("input", onTextInput);
  $("#chat-emoji-icon").on("click", toggleEmojiMenu);
  $("#chat-setting-icon").on("click", toggleSettingsMenu);
  $(".settings-menu .exit .x").on("click", () => toggleSettingsMenu(false));
  $(".bottom .position input").change(onPositionChange);

  $(".settings-menu .body .chat-type").on("click", (event) => {
    const element = $(event.currentTarget);
    const newVersion = element.attr("data-version");
    $.post(
      `https://${GetParentResourceName()}/updateChatStyle`,
      JSON.stringify({
        newStyle: newVersion,
      })
    );
  });

  $("#notification").on("click", toggleNotification);
  $("div.container").attr("class", `container ${chatStyleVersion}`);
  loadEmojiMenu();
  if (isEnvBrowser()) {
    showChatBox();
    showChatInput();
    addMessage(
      "OOC",
      "#00C2FF",
      "#3E768D",
      "Ali Koç",
      "Herkese merhaba.",
      "00:12"
    );
    addMessage(
      "Me",
      "#FF69BA",
      "#664160",
      "Ali Koç",
      "Herkese merhaba.",
      "00:12"
    );
    addMessage(
      "DO",
      "#00C2FF",
      "#3E768D",
      "Ali Koç",
      "While I was working at my desk, my mischievous dog, Max, jumped up on the table and curiously pawed at the file I had left there.",
      "00:12"
    );
    updateSuggestions([
      {
        command: "OOC",
      },
    ]);
  }
});
