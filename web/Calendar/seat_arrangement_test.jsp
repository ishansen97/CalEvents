<%-- 
    Document   : seat_arrangement_test
    Created on : Sep 6, 2018, 9:33:13 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./Layouts/Styles.jsp" %>
        <%@include file="./Layouts/Scripts.jsp" %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <title>Demo of a canvas used to render seat plan in a Cinema</title>
        <script>
            var EMPTY = 0; // Still available for reservation and purchase.
            var RESERVED = 1; // reserved but not yet paid for.
            var BOUGHT = 2; // bought and paid for.

            function Point(x,y) {
                return { X: x, Y: y }
            }
            function Size(w,h) {
                return {Width: w, Height: h}
            }
            function Rectangle(left,top,width,height) {
                return {TopLeft: Point(left,top), Size: Size(width,height)}
            }
            function seatColorFromSeatStatus(seatStatus) {
                switch(seatStatus) {
                    case EMPTY: return "white";
                    case RESERVED: return "green";
                    case BOUGHT: return "red";
                    default: return "black"; // Invalid value...
                }
            }
            function mapSeatStatusToSeatColor(seats)
            {
                var result = {};
                for(seat in seats) {
                    result[seat] = seatColorFromSeatStatus(seats[seat])
                }
                return result;
            }
            function seatKeyFromPosition(row,col) {
                return JSON.stringify([row,col]);
            }
            function seatRowFromKey(key) {
                return (JSON.parse(key))[0];
            }
            function seatColFromKey(key) {
                return (JSON.parse(key)[1]);
            }
            function getSeatInfo(nrows,ncolumns) {
                var result = { NRows: nrows, NColumns: ncolumns, Seats : {} };
                for(row = 0; row < nrows; row++) {
                    for( col = 0; col < ncolumns; col++ ) {
                        result.Seats[seatKeyFromPosition(row,col)] = EMPTY;
                    }
                }
                result.Seats[seatKeyFromPosition(0,4)] = RESERVED;
                result.Seats[seatKeyFromPosition(1,3)] = BOUGHT;
                return result;
            }
            function renderSeat(ctx,r,fillColor) {
                var backup = ctx.fillStyle;
                ctx.strokeStyle = "blue";
                ctx.rect(r.TopLeft.X+2,r.TopLeft.Y+2,r.Size.Width-4,r.Size.Height-4);
                ctx.stroke();
                ctx.fillStyle = fillColor;
                ctx.fillRect(r.TopLeft.X+3,r.TopLeft.Y+3,r.Size.Width-5,r.Size.Height-5);
                ctx.fillStyle = backup;
            }
            function renderSeatplan(seatInfo) {
                var nrows = seatInfo.NRows;
                var ncolumns = seatInfo.NColumns;
                var seatColors = mapSeatStatusToSeatColor(seatInfo.Seats)
                var canvas = document.getElementById("seatplan");
                var ctx = canvas.getContext("2d");

                var borderWidth = 10;
                var rcContent = Rectangle(
                    borderWidth
                    , borderWidth
                    , canvas.width - 2 * borderWidth
                    , canvas.height - 2 * borderWidth
                );
                var szCell = Size(
                    Math.floor(rcContent.Size.Width / (ncolumns + 1))
                    , Math.floor(rcContent.Size.Height / (nrows + 1))
                );
                ctx.font = "30px Arial";

                for(row = -1; row < nrows; row++) {
                    for(col = -1; col < ncolumns; col++ ) {
                        var r = Rectangle(
                            rcContent.TopLeft.X + szCell.Width * (col+1)
                            ,rcContent.TopLeft.Y + szCell.Height * (row+1)
                            ,szCell.Width
                            ,szCell.Height
                            );
                        var center = Point(szCell.Width / 2, szCell.Height / 2);
                        if (row == -1 && col == -1) {
                            // nothing to render.
                        }
                        else if(row == -1){
                            // render column headers as numbers...
                            ctx.fillStyle = "black";
                            ctx.textAlign = "center";
                            ctx.fillText(col.toString(),r.TopLeft.X+center.X,r.TopLeft.Y+center.Y+6);
                        }
                        else if(col == -1){
                            // render row header
                            ctx.fillStyle = "black";
                            ctx.textAlign = "center";
                            ctx.fillText(String.fromCharCode(65 + row),r.TopLeft.X+center.X+4,r.TopLeft.Y+center.Y+6);
                        }
                        else
                        {
                            // render seat
                            renderSeat(ctx,r,seatColors[seatKeyFromPosition(row,col)]);
                        }
                    }
                }
            }
        </script>
    </head>
    <body onload="renderSeatplan(getSeatInfo(10,5));">
        <h1>Seatplan</h1>
        <canvas id="seatplan" width="640" height="480"></canvas>
        
        <div class="container">
  <h2>Modal Example</h2>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>

  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
  
  
</div>

    </body>
</html>
