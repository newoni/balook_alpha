/*
        gocanvas.js -- Play Go (Weiqi) using the <canvas> tag.
               
        Copyright 2011 by Joshua S. Weinstein
        http://josher19.github.com/Go-Weiqi-Canvas/
         
        Portions of this code based on halma.js
		https://github.com/diveintomark/diveintohtml5/blob/master/examples/halma.js
		
		License: http://creativecommons.org/licenses/by/3.0/

*/

var kBoardWidth = 19; // 네모 칸 가로 갯수
var kBoardHeight= kBoardWidth; // 세로 갯수 == 가로 갯수
var kPieceWidth = 30; // 네모 한칸 가로 사이즈 30px
var kPieceHeight= 30; // 네모 한칸 세로 사이즈 30px
var kPixelWidth = 1 + (kBoardWidth * kPieceWidth); // 가로 전체 길이 451px
var kPixelHeight= 1 + (kBoardHeight * kPieceHeight); // 세로 전체 길이 451px

var gCanvasElement = []; // KH modified;
var gDrawingContext = []; // KH modified;
var gPattern;

// var gPieces;
var gPieces=[]; // KH modified;
var gNumPieces;
var gSelectedPieceIndex;
var gSelectedPieceHasMoved;
var gMoveCount;
var gMoveCountElem;
var gGameInProgress;

var gPassedCount = 0; // Two Passes => Quit
var gResigned = false;

// KH variables
var gPiecesKH = []; //only one board game. in KH version, variable gPieces is array which have component of gPiecesKH
var gPiecesKH_tmp = []; // temperature array. only for making gPiecesKH



// 바둑판 리사이징
function resizeBoard(boardsize) {
	kBoardWidth = boardsize; // 파라미터로 들어온 값 == 가로 사이즈
	kBoardHeight= kBoardWidth; // 세로 사이즈 == 가로 사이즈
	kPieceWidth = 30 + 18 - 2*kBoardWidth; // between 30 for 19x19 and 68 for 5x5, 9칸이면 가로 네모 한칸당 50px 13칸이면 가로 네모 한칸당 32px  19칸이면 가로 네모 한칸당 30px
	kPieceHeight= 30 + 18 - 2*kBoardHeight; // 9칸이면 세로 네모 한칸당 50px 13칸이면 세로 네모 한칸당 32px  19칸이면 세로 네모 한칸당 30px
	kPixelWidth = 1 + (kBoardWidth * kPieceWidth); // 전체 가로 길이 9x50+1 = 451px
	kPixelHeight= 1 + (kBoardHeight * kPieceHeight); // 전체 세로 길이 9x50+1 = 451px
	gCanvasElement.width = kPixelWidth // 캔버스 가로크기 == 전체 가로 길이
	gCanvasElement.height = kPixelHeight; // 캔버스 세로크기 == 전체 세로 길이
	drawBoard(); // 바둑판 그리는 함수 호출
	// reset board and other things
	return boardsize;
}
function Cell(row, column, color) {
    this.row = row;
    this.column = column;
	this.color = color || BLANK;
}
Cell.prototype.toString = function() { //Cell 문자열 반환 r == 행 c == 열 p == 색상 or '_'
	return "Cell[r=" + this.row + ", c=" + this.column + ",p = " + this.color + "]";
}


function getCursorPosition(e) { //커서 위치
    /* returns Cell with .row and .column properties */
    var x;
    var y;
    if (e.pageX != undefined && e.pageY != undefined) {
	x = e.pageX; // pageX x좌표 스크롤 포함 측정
	y = e.pageY; // pageY y좌표 스크롤 포함 측정
    }
    else {
	x = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft; // clientX x좌표 스크롤 무시 해당 페이지 상단 0으로 측정, scrollLeft : 가로 픽셀 수
	y = e.clientY + document.body.scrollTop + document.documentElement.scrollTop; // clientY y좌표 스크롤 무시 해당 페이지 상단 0으로 측정 scrollTop : 세로 픽셀 수
    }

    console.log('check gCanvas Element');
    console.log(gCanvasElement.offsetLeft);
    console.log(gCanvasElement.offsetTop);
    x -= gCanvasElement.offsetLeft; // offsetX 이벤트 대상객체 상대적 마우스 x좌표 위치 반환, e.clientX - offsetLeft
    y -= gCanvasElement.offsetTop; // offsetY 이벤트 대상객체 상대적 마우스 y좌표 위치 반환 e.clientY - offsetTop
    x = Math.min(x, kBoardWidth * kPieceWidth);
    y = Math.min(y, kBoardHeight * kPieceHeight);

    console.log('x, y position');
    console.log(x);
    console.log(y);
    var cell = new Cell(Math.floor(y/kPieceHeight), Math.floor(x/kPieceWidth)); // 지정된 수보다 더 큰 정수로 반환
    return cell;
}

// jsw

function goOnClick(e) {
    console.log('go on click is invoked');
	var cell = getCursorPosition(e);

	var player = gMoveCount % 2 ? WHITE : BLACK; // gMoveCount 짝수는 흰돌 홀수는 흑돌
    return addPiece(cell, player); // cell에 돌 추가

}

// ####s made by KH <21.06.27>
function goOnKH(idx, row, col, playerNumber){
    var cell = getKHPosition(idx, row, col);
    var player = playerNumber % 2 ? BLACK : WHITE; // gMoveCount 짝수는 흰돌 홀수는 흑돌
    addPieceKH(cell, player); // cell에 돌 추가
}

// make KH position
function getKHPosition(idx, row, col){
    x=gCanvasElement[idx].offsetLeft + row*30-330;
    y=gCanvasElement[idx].offsetTop + col *30 -210 ;
    var cell = new Cell(Math.floor(y/kPieceHeight), Math.floor(x/kPieceWidth));
    return cell;
}

// ####e

function numeric(x) { return typeof x === "number" }

function rndMove(cb) {
	var r=rndItem(), cols=goboard[r].map(function(it,n) { return it==BLANK && n }).filter(numeric); // map 새 배열 생성
	var c=cols[rndItem(cols.length)] || 0;
	var cc = new Cell( r, c, curPlayer.color); // 플레이어 돌 색상
	var moved = addPiece(cc, curPlayer.color);
	if (cb) cb(cc, moved);
	return moved;
}

function rndBoard(size) { 
	if (null == size) size = kBoardSize*(kBoardSize-2);
	if ("undefined" === typeof curPlayer) curPlayer = players[gMoveCount % 2];
	var _info = info; info = function() {}; 
	for(var sum=0, i=0; i < size; i += 1) sum += rndMove(); 
	info=_info; 
	return sum/size; 
}

function isOccupied(cell) { //어떤 부분이 클릭되었는지 아는 함수
  for (var i = 0; i < gPieces.length; i++) {
	if ((gPieces[i].row == cell.row) && 
	    (gPieces[i].column == cell.column)) {	    
		cell.stepsOn = i; // if we need to know which piece was clicked
	    return true;
	}
  }
  return false;
}

// these needed to be filled in

function illegalmove(cell, color) { return isOccupied(cell); }

function checkCapture(cell, color, docapture) { return false; }

function updateScore(color, points) { return false; }

function moveToCell(cell) {
	if (typeof GO != "undefined" && GO && "function" == typeof GO.moveTo) {
		return GO.moveTo(cell.row, cell.column, cell.color);
	}
	return true;
}

/** Add piece to board */
function addPiece(cell, color) {
    console.log('addPiece is invoked');
    console.log(cell);
    console.log(color);

	cell.color = color;
    log(cell);

	// check for capture or illegal move // 잘못된 이동 확인 여부
	var points = checkCapture(cell, color, true);
	if (points) {
		updateScore(color, points);
	} else if (illegalmove(cell, color)) {
		log("Illegal Move to " + cell);
		warn("Illegal Move to " + cell);
		return false;
	}
	if (!moveToCell(cell)) { 
		log("Cannot move to " + cell)
		return false
	}
	// moveAndCapture(cell)
	gPieces.push(cell) 
	nextPlayer()
    //showUpdatedBoard();
	return true;
}


/** Add piece to board with KH version */
function addPieceKH(cell, color) {
    console.log('addPiece KH version is invoked');

    cell.color = color;
    log(cell);

    // check for capture or illegal move // 잘못된 이동 확인 여부
    var points = checkCapture(cell, color, true);

    gPiecesKH_tmp.push(cell)  // modify subject

    if (points) {
        updateScore(color, points);
    } else if (illegalmove(cell, color)) {
        log("Illegal Move to " + cell);
        warn("Illegal Move to " + cell);
        return false;
    }
    if (!moveToCell(cell)) {
        log("Cannot move to " + cell)
        return false
    }
    // moveAndCapture(cell)

    // nextPlayer()
    return true;
}

/** Next Player's Turn */ //다음 플레이어 턴
function nextPlayer() {
    gPieces = updateBoard(gPieces);
	drawBoard()
	var pnum = (gMoveCount++) % 2;
	if ("undefined" != typeof players && players) curPlayer = players[pnum];
	if (document.forms.go && document.forms.go.player) {
		document.forms.go.player[pnum].checked = true;
	}
}

/** TODO: Look into other scoring methods, eye or captured pieces count */
function getScore() { return gPieces.map(function(item) { switch(item.color) { case BLACK: return -1; break; case WHITE: return 1; break; default: return 0; break;} }).reduce(function(a,b) {return a+b}); }

function isTheGameOver() { // 패스카운트 2이상 or gResigned
    return gPassedCount >= 2 || gResigned;
}
function isBlack(piece) {
	return piece.color == BLACK;
}

/** Button Click Events for the Form */
function initForm(frm) {
	if (frm.confirm) frm.confirm.onclick = function(ev) {gPassedCount = 0;}
	if (frm.pass) frm.pass.onclick = function(ev) {++gPassedCount;info("pass");nextPlayer();}
	if (frm.resign) frm.resign.onclick = function(ev) {gResigned = true; GO.showFinalVictor(); }
}

//draw board with KH method
function drawBoardWithKHMethod(cnt) { // 새로운 바둑판 그리기
    console.log('drawBoard is invoked');
    if (gGameInProgress && isTheGameOver()) {
        endGame();
    }

    gDrawingContext.clearRect(0, 0, kPixelWidth, kPixelHeight); // (x, y, 가로 전체길이, 세로 전체길이)

    gDrawingContext.beginPath(); //새로운 경로 생성

    /* vertical lines */
    var startpx = kPieceWidth / 2;
    for (var x = startpx; x <= kPixelWidth; x += kPieceWidth) {
        gDrawingContext.moveTo(0.5 + x, startpx); //moveTo(x, y) (en-US) 펜을  x와 y 로 지정된 좌표로 옮깁니다.
        gDrawingContext.lineTo(0.5 + x, kPixelHeight - startpx); //lineTo(x, y) (en-US) 현재의 드로잉 위치에서 x와 y로 지정된 위치까지 선을 그립니다.
    }

    /* horizontal lines */
    for (var y = startpx; y <= kPixelHeight; y += kPieceHeight) {
        gDrawingContext.moveTo(startpx, 0.5 + y);
        gDrawingContext.lineTo(kPixelWidth - startpx, 0.5 +  y);
    }

    /* draw it! */
    gDrawingContext.strokeStyle = "#ccc";
    gDrawingContext.stroke();

    for (var i = 0; i < gPieces.length - cnt; i++) {
        drawPiece(gPieces[i], isBlack(gPieces[i], i == gSelectedPieceIndex));
    }

    gMoveCountElem.innerHTML = gMoveCount;

    saveGameState();
}

// draw board
function drawBoard() { // 새로운 바둑판 그리기
    console.log('drawBoard is invoked');
    if (gGameInProgress && isTheGameOver()) {
	endGame();
    }

    gDrawingContext.clearRect(0, 0, kPixelWidth, kPixelHeight); // (x, y, 가로 전체길이, 세로 전체길이)

    gDrawingContext.beginPath(); //새로운 경로 생성
    
    /* vertical lines */
    var startpx = kPieceWidth / 2;
    for (var x = startpx; x <= kPixelWidth; x += kPieceWidth) {
        gDrawingContext.moveTo(0.5 + x, startpx); //moveTo(x, y) (en-US) 펜을  x와 y 로 지정된 좌표로 옮깁니다.
        gDrawingContext.lineTo(0.5 + x, kPixelHeight - startpx); //lineTo(x, y) (en-US) 현재의 드로잉 위치에서 x와 y로 지정된 위치까지 선을 그립니다.
    }
    
    /* horizontal lines */
    for (var y = startpx; y <= kPixelHeight; y += kPieceHeight) {
		gDrawingContext.moveTo(startpx, 0.5 + y);
		gDrawingContext.lineTo(kPixelWidth - startpx, 0.5 +  y);
    }
    
    /* draw it! */
    gDrawingContext.strokeStyle = "#ccc";
    gDrawingContext.stroke();
    
    for (var i = 0; i < gPieces.length; i++) {
	drawPiece(gPieces[i], isBlack(gPieces[i], i == gSelectedPieceIndex));
    }

    gMoveCountElem.innerHTML = gMoveCount;

    saveGameState();
}

function drawBoardKH(idx) { // 새로운 바둑판 그리기
    console.log('drawBoard is invoked');
    if (gGameInProgress && isTheGameOver()) {
        console.log("test here is drawBoard KH end game is invoked");
        endGame();
    }

    gDrawingContext[idx].clearRect(0, 0, kPixelWidth, kPixelHeight); // (x, y, 가로 전체길이, 세로 전체길이)

    gDrawingContext[idx].beginPath(); //새로운 경로 생성

    /* vertical lines */
    var startpx = kPieceWidth / 2;
    for (var x = startpx; x <= kPixelWidth; x += kPieceWidth) {
        gDrawingContext[idx].moveTo(0.5 + x, startpx); //moveTo(x, y) (en-US) 펜을  x와 y 로 지정된 좌표로 옮깁니다.
        gDrawingContext[idx].lineTo(0.5 + x, kPixelHeight - startpx); //lineTo(x, y) (en-US) 현재의 드로잉 위치에서 x와 y로 지정된 위치까지 선을 그립니다.
    }

    /* horizontal lines */
    for (var y = startpx; y <= kPixelHeight; y += kPieceHeight) {
        gDrawingContext[idx].moveTo(startpx, 0.5 + y);
        gDrawingContext[idx].lineTo(kPixelWidth - startpx, 0.5 +  y);
    }

    /* draw it! */
    gDrawingContext[idx].strokeStyle = "#ccc";
    gDrawingContext[idx].stroke();

    for (var i = 0; i < gPiecesKH[idx].length; i++) {
        console.log("here is drawBoardKH, drawPieceKH will invoke ");
        drawPieceKH(idx, gPiecesKH[idx][i], isBlack(gPiecesKH[idx][i], i == gSelectedPieceIndex));
    }

    gMoveCountElem.innerHTML = gMoveCount;

    saveGameState();
}

function drawPiece(p, selected) { //바둑 돌 그리기
    var column = p.column;
    var row = p.row;
    var x = (column * kPieceWidth) + (kPieceWidth/2);
    var y = (row * kPieceHeight) + (kPieceHeight/2);
    var radius = (kPieceWidth/2) - (kPieceWidth/10);
    gDrawingContext.strokeStyle = "#000";
    gDrawingContext.strokeWidth = 4;
    gDrawingContext.beginPath();
    gDrawingContext.arc(x, y, radius, 0, Math.PI*2, false); // arc(x, y, radius, startAngle, endAngle, anticlockwise) (en-US) 원그릴때 false이면 시계방향 true이면 반 시계방향
    gDrawingContext.closePath();
    gDrawingContext.stroke();
    gDrawingContext.fillStyle = "#fff";
    if (selected) {
	gDrawingContext.fillStyle = "#000";
    }
    gDrawingContext.fill();
}
//KH modified
function drawPieceKH(idx, p, selected) { //바둑 돌 그리기
    var column = p.column;
    var row = p.row;
    var x = (column * kPieceWidth) + (kPieceWidth/2);
    var y = (row * kPieceHeight) + (kPieceHeight/2);
    var radius = (kPieceWidth/2) - (kPieceWidth/10);
    gDrawingContext[idx].strokeStyle = "#000";
    gDrawingContext[idx].strokeWidth = 4;
    gDrawingContext[idx].beginPath();
    gDrawingContext[idx].arc(x, y, radius, 0, Math.PI*2, false); // arc(x, y, radius, startAngle, endAngle, anticlockwise) (en-US) 원그릴때 false이면 시계방향 true이면 반 시계방향
    gDrawingContext[idx].closePath();
    gDrawingContext[idx].stroke();
    gDrawingContext[idx].fillStyle = "#fff";
    if (selected) {
        gDrawingContext[idx].fillStyle = "#000";
    }
    gDrawingContext[idx].fill();
}

if (typeof resumeGame != "function") {
    saveGameState = function() {
	return false;
    }
    resumeGame = function() {
	return false;
    }
}

function newGame() {
    gPieces = [];
    gNumPieces = gPieces.length;
    gSelectedPieceIndex = -1;
    gSelectedPieceHasMoved = false;
    gMoveCount = 0;
    gGameInProgress = true;
    drawBoard();
}

function endGame() {
    gSelectedPieceIndex = -1;
    gGameInProgress = false;
    info("The game is over"); // should display prominently, disable parts of UI
    if (initGame.frm && initGame.frm.boardSize) initGame.frm.boardSize.disabled = false;
    GO.showFinalVictor();
    // initGame.restart();
}

function initGame(canvasElement, moveCountElement, frm) {
    console.log("init Game is invoked");
	initGame.frm = frm;
	if (frm && frm.boardSize) frm.boardSize.onchange = function(ev) {
        console.log("first if");
		if (gPieces.length === 0 || gGameInProgress === false) { // first move or game over
			gPieces.length = 0; // truncate
			resizeBoard(this.value);
			GO.setSize(this.value);

		} else {
			info("must finish current game");
			this.value = goboard.length;
			this.disabled=true;
		}
	}
    if (!canvasElement) {
        console.log("2nd if");
        canvasElement = document.createElement("canvas");
	canvasElement.id = "gocanvas";
	document.body.appendChild(canvasElement);
    }
    if (!moveCountElement) {
        console.log("3rd if");
        moveCountElement = document.createElement("p");
	document.body.appendChild(moveCountElement);
    }
    gCanvasElement = canvasElement;
    gCanvasElement.width = kPixelWidth;
    gCanvasElement.height = kPixelHeight;
    gCanvasElement.addEventListener("click", goOnClick, false);
    gMoveCountElem = moveCountElement;
    gDrawingContext = gCanvasElement.getContext("2d");
    initForm(frm);
    if (!resumeGame()) {
	newGame();
    }
}


// init Game KH version
function initGameKH(idx, canvasElement, moveCountElement, frm) {
    console.log("init Game is invoked");
    initGame.frm = frm;
    if (frm && frm.boardSize) frm.boardSize.onchange = function(ev) {
        console.log("first if");
        if (gPieces.length === 0 || gGameInProgress === false) { // first move or game over
            gPieces.length = 0; // truncate
            resizeBoard(this.value);
            GO.setSize(this.value);

        } else {
            info("must finish current game");
            this.value = goboard.length;
            this.disabled=true;
        }
    }
    if (!canvasElement) {
        console.log("2nd if");
        canvasElement = document.createElement("canvas");
        canvasElement.id = "gocanvas"+idx;
        document.body.appendChild(canvasElement);
    }
    if (!moveCountElement) {
        console.log("3rd if");
        moveCountElement = document.createElement("p");
        document.body.appendChild(moveCountElement);
    }
    gCanvasElement[idx] = canvasElement;
    gCanvasElement[idx].width = kPixelWidth;
    gCanvasElement[idx].height = kPixelHeight;
    gMoveCountElem = moveCountElement;
    gDrawingContext[idx] = gCanvasElement[idx].getContext("2d");
    initForm(frm);
    if (!resumeGame()) {
        newGameKH(idx);
    }
}

//newGame KH version
function newGameKH(idx) {
    gPieces = [];
    gNumPieces = gPieces.length;
    gSelectedPieceIndex = -1;
    gSelectedPieceHasMoved = false;
    gMoveCount = 0;
    gGameInProgress = true;
    // drawBoard();
    // drawBoardKH(idx);
}
