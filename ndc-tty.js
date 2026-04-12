const term = document.getElementById("term");

const ndcMaker = window.ttyNdc;
const proto = location.protocol === "https:" ? "wss" : "ws";
const ndc = ndcMaker.create(term, { url: proto + "://" + location.hostname + ":" + location.port + "/tty" });

ndc.onMessage = function onMessage(ev) {
  return true;
};
