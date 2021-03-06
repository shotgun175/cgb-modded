#cs ----------------------------------------------------------------------------
   AutoIt Version: 3.3.6.1
   This file was made to software CoCgameBot v3.0
   Author:         Sardo
   Script Function: ProfileReport()
   Description : This function will report Attacks Won, Defenses Won, Troops Donated and Troops Received from Profile info page
CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<[url=http://www.gnu.org/licenses/]http://www.gnu.org/licenses/[/url]>.
#ce ----------------------------------------------------------------------------
Func ProfileReport()
   ClickP($TopLeftClient) ;Click Away
   If _Sleep(500) Then Return
   SetLog("Profile Report", $COLOR_BLUE)
   SetLog("Opening Profile page to read atk, def, donated and received...", $COLOR_BLUE)
   Click(220, 33) ; Click Info Profile Button
   If _Sleep(1000) Then Return
   _CaptureRegion()
    Local $i = 0
 While _ColorCheck(_GetPixelColor(639, 133), Hex(0xcad8e5, 6), 20) = False ; wait for Info Profile to open
  $i += 1
  If _Sleep(500) Then Return
  _CaptureRegion()
  If $i >= 20 Then ExitLoop
  WEnd
      $AttacksWon      = GetOther(639, 133, "MyProfile")
      $DefensesWon    = GetOther(639, 159, "MyProfile")
      $TroopsDonated  = GetOther(639, 188, "MyProfile")
      $TroopsReceived = GetOther(639, 213, "MyProfile")
      SetLog(" [ATKW]: " &   _NumberFormat($AttacksWon) & " [DEFW]: " &  _NumberFormat($DefensesWon) & " [TDON]: " &  _NumberFormat($TroopsDonated) & " [TREC]: " &  _NumberFormat($TroopsReceived) , $COLOR_GREEN)
      Click(820, 40) ; Close Profile page
EndFunc   ;==>ProfileReport