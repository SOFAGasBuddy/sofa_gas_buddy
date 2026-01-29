import 'package:flutter_test/flutter_test.dart';
import 'package:sofa_gas_buddy/car.dart';
import 'package:sofa_gas_buddy/esso_data.dart';
import 'package:html/parser.dart';

String testPage = r"""


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head><meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9"><title>
	ESSO Cards
</title>
        <script language="JavaScript" type="text/javascript" src="Include/cal2.js"></script>
        <script language="JavaScript" type="text/javascript" src="Include/cal_conf2.js"></script>
        <script language="JavaScript" type="text/javascript" src="Include/JavaScripts.js"></script>
        
<link href="App_Themes/ESSO/ESSO.css" type="text/css" rel="stylesheet" />
<script>(window.BOOMR_mq=window.BOOMR_mq||[]).push(["addVar",{"rua.upush":"false","rua.cpush":"false","rua.upre":"false","rua.cpre":"false","rua.uprl":"true","rua.cprl":"false","rua.cprf":"false","rua.trans":"SJ-120d4856-f479-47ab-9285-934f3a258eb6","rua.cook":"true","rua.ims":"false","rua.ufprl":"false","rua.cfprl":"false","rua.isuxp":"false","rua.texp":"norulematch","rua.ceh":"false","rua.ueh":"false","rua.ieh.st":"0"}]);</script>
                              <script>!function(e){var n="https://s.go-mpulse.net/boomerang/";if("False"=="True")e.BOOMR_config=e.BOOMR_config||{},e.BOOMR_config.PageParams=e.BOOMR_config.PageParams||{},e.BOOMR_config.PageParams.pci=!0,n="https://s2.go-mpulse.net/boomerang/";if(window.BOOMR_API_key="49BPX-8ASHB-VSSZY-JLMSU-UKGPG",function(){function e(){if(!o){var e=document.createElement("script");e.id="boomr-scr-as",e.src=window.BOOMR.url,e.async=!0,i.parentNode.appendChild(e),o=!0}}function t(e){o=!0;var n,t,a,r,d=document,O=window;if(window.BOOMR.snippetMethod=e?"if":"i",t=function(e,n){var t=d.createElement("script");t.id=n||"boomr-if-as",t.src=window.BOOMR.url,BOOMR_lstart=(new Date).getTime(),e=e||d.body,e.appendChild(t)},!window.addEventListener&&window.attachEvent&&navigator.userAgent.match(/MSIE [67]\./))return window.BOOMR.snippetMethod="s",void t(i.parentNode,"boomr-async");a=document.createElement("IFRAME"),a.src="about:blank",a.title="",a.role="presentation",a.loading="eager",r=(a.frameElement||a).style,r.width=0,r.height=0,r.border=0,r.display="none",i.parentNode.appendChild(a);try{O=a.contentWindow,d=O.document.open()}catch(_){n=document.domain,a.src="javascript:var d=document.open();d.domain='"+n+"';void(0);",O=a.contentWindow,d=O.document.open()}if(n)d._boomrl=function(){this.domain=n,t()},d.write("<bo"+"dy onload='document._boomrl();'>");else if(O._boomrl=function(){t()},O.addEventListener)O.addEventListener("load",O._boomrl,!1);else if(O.attachEvent)O.attachEvent("onload",O._boomrl);d.close()}function a(e){window.BOOMR_onload=e&&e.timeStamp||(new Date).getTime()}if(!window.BOOMR||!window.BOOMR.version&&!window.BOOMR.snippetExecuted){window.BOOMR=window.BOOMR||{},window.BOOMR.snippetStart=(new Date).getTime(),window.BOOMR.snippetExecuted=!0,window.BOOMR.snippetVersion=12,window.BOOMR.url=n+"49BPX-8ASHB-VSSZY-JLMSU-UKGPG";var i=document.currentScript||document.getElementsByTagName("script")[0],o=!1,r=document.createElement("link");if(r.relList&&"function"==typeof r.relList.supports&&r.relList.supports("preload")&&"as"in r)window.BOOMR.snippetMethod="p",r.href=window.BOOMR.url,r.rel="preload",r.as="script",r.addEventListener("load",e),r.addEventListener("error",function(){t(!0)}),setTimeout(function(){if(!o)t(!0)},3e3),BOOMR_lstart=(new Date).getTime(),i.parentNode.appendChild(r);else t(!1);if(window.addEventListener)window.addEventListener("load",a,!1);else if(window.attachEvent)window.attachEvent("onload",a)}}(),"".length>0)if(e&&"performance"in e&&e.performance&&"function"==typeof e.performance.setResourceTimingBufferSize)e.performance.setResourceTimingBufferSize();!function(){if(BOOMR=e.BOOMR||{},BOOMR.plugins=BOOMR.plugins||{},!BOOMR.plugins.AK){var n="true"=="true"?1:0,t="cookiepresent",a="vxczlyyxhzbve2l2yv6q-f-e5fba0c5e-clientnsv4-s.akamaihd.net",i="false"=="true"?2:1,o={"ak.v":"39","ak.cp":"1661004","ak.ai":parseInt("1071404",10),"ak.ol":"0","ak.cr":22,"ak.ipv":4,"ak.proto":"h3","ak.rid":"fbe618ab","ak.r":47358,"ak.a2":n,"ak.m":"dsca","ak.n":"essl","ak.bpcip":"173.197.149.0","ak.cport":63521,"ak.gh":"23.208.24.237","ak.quicv":"0x00000001","ak.tlsv":"tls1.3","ak.0rtt":"","ak.0rtt.ed":"","ak.csrc":"-","ak.acc":"","ak.t":"1769653629","ak.ak":"hOBiQwZUYzCg5VSAfCLimQ==Lt7aZASCLQu622tH8e8f7tBYmVcxu7nvkL3dNe/Z3Frw6nM+CECy6kMlBn92XdLPpvKjo1ezaxQ2mWwhl/qOQdk4dQoW7gS9ujrX4hzS/Dba+GTYC6/Pahsnv4HGYttwL6QreWYZaoo4XlQmCmxgdaWojH7vq565ni/I7RaBr7Da4OPM31H8/5db+4v2g9efHDc62NLi0doThEDZsOSxhkMIySSpyFfz8Y15MVS5BYA3NGEZcIdar23lskR7fewaJv+mDPapj8WjmrowEtIsBexQimCP6t2LCd3tf0gTfk7bJ1mDov9NQXwaB6s6MgNTpB/1ZMOJzU7K4edwUL7NZGXP0FzwpyQBH2s7w+6QUrh25GT0EMMlUCTkeQUt1jQK84biI3Jm7i4FO9G37dtRyxlFEU+TkN7z1mBG8l+gTpQ=","ak.pv":"4","ak.dpoabenc":"","ak.tf":i};if(""!==t)o["ak.ruds"]=t;var r={i:!1,av:function(n){var t="http.initiator";if(n&&(!n[t]||"spa_hard"===n[t]))o["ak.feo"]=void 0!==e.aFeoApplied?1:0,BOOMR.addVar(o)},rv:function(){var e=["ak.bpcip","ak.cport","ak.cr","ak.csrc","ak.gh","ak.ipv","ak.m","ak.n","ak.ol","ak.proto","ak.quicv","ak.tlsv","ak.0rtt","ak.0rtt.ed","ak.r","ak.acc","ak.t","ak.tf"];BOOMR.removeVar(e)}};BOOMR.plugins.AK={akVars:o,akDNSPreFetchDomain:a,init:function(){if(!r.i){var e=BOOMR.subscribe;e("before_beacon",r.av,null,null),e("onbeacon",r.rv,null,null),r.i=!0}return this},is_complete:function(){return!0}}}}()}(window);</script></head>
    <body onload="doFocus();">
        <form name="aspnetForm" method="post" action="./" language="javascript" onsubmit="javascript:return WebForm_OnSubmit();" id="aspnetForm">
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJODcxOTcwMjI0D2QWAmYPZBYCAgMPZBYEAgEPZBYEAgIPZBYCZg9kFggCAQ8PFgQeCENzc0NsYXNzBQ9uYXZsaW5rLWN1cnJlbnQeBF8hU0ICAmRkAgMPDxYEHwAFB25hdmxpbmsfAQICZGQCBQ8PFgQfAAUHbmF2bGluax8BAgJkZAIHDw8WBh8ABQduYXZsaW5rHwECAh4HVmlzaWJsZWdkZAIFDw8WAh8CZ2QWAmYPZBYIAgEPDxYEHwAFD25hdmxpbmstY3VycmVudB8BAgJkZAIDDw8WBB8ABQduYXZsaW5rHwECAmRkAgUPDxYEHwAFB25hdmxpbmsfAQICZGQCBw8PFgQfAAUHbmF2bGluax8BAgJkZAIDD2QWBgIBDw8WAh4EVGV4dGVkZAIDDw8WAh8CaGQWAgIBD2QWCmYPD2QWAh4Kb25LZXlQcmVzcwUyZG9DbGljaygnU3lzdGVtLldlYi5VSS5XZWJDb250cm9scy5CdXR0b24nLCBldmVudClkAgIPEGRkFgECAWQCBQ8PZBYCHwQFMmRvQ2xpY2soJ1N5c3RlbS5XZWIuVUkuV2ViQ29udHJvbHMuQnV0dG9uJywgZXZlbnQpZAIJDw8WAh8DZWRkAgoPDxYCHwJnZBYCAgEPDxYCHwMFPlRheC1mcmVlIGZ1ZWwgaXMgbm90IGF1dGhvcml6ZWQgYXQgdW5hdHRlbmRlZCBnYXMgc3RhdGlvbnMuPHA+ZGQCBQ8PFgIfAmdkFgICAQ8PFhQeDUFwcERhdGFMb2FkZWRnHgdFbmREYXRlBgBAHy4AXt4IHhJ0cmFuc2FjdGlvbnNfc3RhdGUFAk9uHhdUcmFuc2FjdGlvblBhZ2VSb3dDb3VudGYeEmFjY291bnRfaW5mb19zdGF0ZQUCT24eEENhcmRQYWdlUm93Q291bnRmHglTdGFydERhdGUGAAD4tMhI3ggeDnZlaGljbGVzX3N0YXRlBQJPbh4TVmVoaWNsZVBhZ2VSb3dDb3VudGYeFXZlaGljbGVfZGV0YWlsc19zdGF0ZQUCT25kFggCCA9kFgRmDw8WAh4ISW1hZ2VVcmwFEy4uL0ltYWdlcy9taW51cy5naWZkZAIBDxYCHgVzdHlsZQUhZGlzcGxheTpibG9jazt2aXNpYmlsaXR5OnZpc2libGU7FgYCAw8P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" />

<script type="text/javascript">
<!--
var theForm = document.forms['aspnetForm'];
if (!theForm) {
    theForm = document.aspnetForm;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
// -->
</script>



<script src="/esso/WebResource.axd?d=Xr1s12uAA8mttUAvFJ32IBsqFd8Bwj7gvmINgWq0JEtZdFzEIwGbq6uDk9ohYTJio1S62mI1Juo3O5BlsqbJ_gTeCedPCTLElqYOqjzxwaA1&amp;t=638901361900000000" type="text/javascript"></script>
<script type="text/javascript">
<!--
function WebForm_OnSubmit() {
if (typeof(ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) return false;
return true;
}
// -->
</script>

<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="AF61E585" />
<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEdABkqIoB14Ze5V6xEZ13FH/PWR8nthnGB45fYXxTfNYga44/7eQ0n0CnrZenb8tHHNWegpprv442OHDmhFoRtDa/RCUoZKs8cGFFQKF60M/VyclcA3e8sUF5/JTp9oATRYJ1gmXqbaeyfqXdFUVgrM1q3LkJbG6VlexT8EXKMkwC+CCKdKOshhPpciWPDibe6+dTHspH5/lRrYin+AYJqKAYt5HtcVu0gdWUHEmCGawoFMx2JR20wNEkIwW7MVbi6gQsUfVyw2CrZTZN8TloE54nmUm+dTS7Ccpi6hXi73pExgcFe1HLJ/X1/8ot2jll5N0qgmiqewyOarIb2n5HA0eLG7tkGkHisk4cnLs+W66fUKSlQ2j4Me7nJPeG38JD/icjzGUoVPXLDS5wAHdjJrDLy3F2x6E+il02nRI4uXatk0aTvqB6eJNesmXbIUf9t/ou15DdyaLOTsU3fU2SErb2uIWHJfQCjR4imjLE37JvsmzNRz4B7YwVKgZlFsgsOzc1YL5v0oaZGsMw0md202T7G81OoChPdK0X9DssU0sgzsNF++qtwvr81MEiNGJwZiH0=" />
            
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td width="200px">
            <a href="http://odin.aafes.com/esso/Default.aspx">
                <img id="_ctl0_Header1_imgCardsNotIE" src="Images/NewEssoCard.jpg" alt="ESSO cards" border="0" style="height:auto;width:100%;" />
            </a>
        </td>
        <td>
            <table width="100%">
                <tr>
                    <td style="background-color: #336699; text-align: right" height="35">
                        <span id="_ctl0_Header1_lblHeaderTextNotIE" class="title">My ESSO Account&nbsp;&nbsp; </span>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                        <div id="_ctl0_Header1_ucNavigationNotIE_pnlNavigation" style="text-align:right;">
	
	<table class="navigation" cellspacing="0" cellpadding="2" width="100%" border="0">
		<tr>
			<td align="right">
				<a id="_ctl0_Header1_ucNavigationNotIE_lnkbtnHome" title="Home" class="navlink-current" href="javascript:__doPostBack(&#39;_ctl0$Header1$ucNavigationNotIE$lnkbtnHome&#39;,&#39;&#39;)">Home</a>|<a id="_ctl0_Header1_ucNavigationNotIE_lnkbtnPayments" title="Payments" class="navlink" href="javascript:__doPostBack(&#39;_ctl0$Header1$ucNavigationNotIE$lnkbtnPayments&#39;,&#39;&#39;)">Payments</a>|<a id="_ctl0_Header1_ucNavigationNotIE_lnkbtnStatements" title="Statements" class="navlink" href="javascript:__doPostBack(&#39;_ctl0$Header1$ucNavigationNotIE$lnkbtnStatements&#39;,&#39;&#39;)">Statements</a>|<a id="_ctl0_Header1_ucNavigationNotIE_lnkbtnLogOut" title="Log Out" class="navlink" href="javascript:__doPostBack(&#39;_ctl0$Header1$ucNavigationNotIE$lnkbtnLogOut&#39;,&#39;&#39;)">Log Out</a></td>
		</tr>
	</table>
	<table border="0" cellspacing="0" cellpadding="2" width="100%">
	    <tr>
	        <td style="text-align: left; vertical-align: top; font-size: 8pt;">
                Questions or Concerns about your fuel card account – please send an e-mail to: <a href="mailto:redacted@aafes.com">mailto:redacted@aafes.com</a>
            </td>
	        <td style="text-align: right; margin-right: 15px; vertical-align: top; white-space: nowrap;">
	            <!-- SR 17664 -->
	            <a href="http://www.aafes.com/exchange-stores/overseas/germany-fuel-ration/" title="German Fuel Ration Program" target="_blank">German Fuel Ration Program</a>
	        </td>
	    </tr>
	</table>

</div>

                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<div style="padding-bottom:10px"></div>
            
    
	
	<div id="_ctl0_ContentPlaceHolder1_pnlESSOPanel" class="panel-styles">
	
	    <input name="_ctl0:ContentPlaceHolder1:ucESSOPanel:account_info_state" type="hidden" id="_ctl0_ContentPlaceHolder1_ucESSOPanel_account_info_state" value="On" />
<input name="_ctl0:ContentPlaceHolder1:ucESSOPanel:vehicles_state" type="hidden" id="_ctl0_ContentPlaceHolder1_ucESSOPanel_vehicles_state" value="On" />
<input name="_ctl0:ContentPlaceHolder1:ucESSOPanel:transactions_state" type="hidden" id="_ctl0_ContentPlaceHolder1_ucESSOPanel_transactions_state" value="On" />
<input name="_ctl0:ContentPlaceHolder1:ucESSOPanel:vehicle_details_state" type="hidden" id="_ctl0_ContentPlaceHolder1_ucESSOPanel_vehicle_details_state" value="On" />

<!-- Account information -->
<div id="_ctl0_ContentPlaceHolder1_ucESSOPanel_pnlAccountInformation">
		
    <fieldset style="margin-top: 10px">
        <legend>
            <a onmousedown="toggleDiv('_ctl0_ContentPlaceHolder1_ucESSOPanel_account_info');" href="javascript:void(0);"><span style="margin-right: 10px; background-color: white"><img id="_ctl0_ContentPlaceHolder1_ucESSOPanel_imgAccountInfo" src="Images/minus.gif" border="0" /></span></a> <a onmousedown="toggleDiv('_ctl0_ContentPlaceHolder1_ucESSOPanel_account_info');" href="javascript:void(0);">Account Information</a>
        </legend>
        <div id="_ctl0_ContentPlaceHolder1_ucESSOPanel_account_info" style="display:block;visibility:visible;">
            <table cellspacing="0" cellpadding="0" width="75%" border="0">
                <tr>
                    <td valign="top">
                        <!-- Sponsor information -->
                        <table border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td valign="top"><h3 style="text-decoration: underline; padding: 0px; margin: 0px;">Sponsor Information</h3>MCPERSON,GUY R<br />PSC 666<br />0007<br />APO, AE  99999<br /><br /><label for="Country">Country:</label> Germany (030)<br /><label for="Phone">Phone:</label> 0015555555555<br /></td></tr></table>
                    </td>
                    <td valign="top">
                        <!-- Account number, balance, creation date -->
                        <table cellspacing="0" cellpadding="2" border="0">
                            <!--
							<tr>
								<td noWrap align="right"><Label for="Account Number">Account Number: </Label>
								</td>
								<td noWrap>
									<span id="_ctl0_ContentPlaceHolder1_ucESSOPanel_lblAccountNumber">7997440000018349</span></td>
							</tr>
							-->
                            <tr>
                                <td nowrap align="right">
                                    <label for="Balance">
                                        Balance:
                                    </label>
                                </td>
                                <td nowrap>
                                    <span id="_ctl0_ContentPlaceHolder1_ucESSOPanel_lblAccountBalance">$3.50</span>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap align="right">
                                    <label for="Creation Date">
                                        Creation Date:
                                    </label>
                                </td>
                                <td nowrap>
                                    <span id="_ctl0_ContentPlaceHolder1_ucESSOPanel_lblCreationDate">22 Nov 1963</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <div style="padding-top: 6pt">
                <input type="submit" name="_ctl0:ContentPlaceHolder1:ucESSOPanel:btnGetAccountTransactions" value="Get Transactions for this Account" id="_ctl0_ContentPlaceHolder1_ucESSOPanel_btnGetAccountTransactions" class="button" /></div>
        </div>
        <!-- account_info -->
    </fieldset>

	</div>
<!-- pnlAccountInformation -->
<!-- Vehicle list -->
<div id="_ctl0_ContentPlaceHolder1_ucESSOPanel_pnlESSOPanel">
		
    <fieldset style="margin-top: 10px">
        <legend>
            <a onmousedown="toggleDiv('_ctl0_ContentPlaceHolder1_ucESSOPanel_vehicles');" href="javascript:void(0);"><span style="margin-right: 10px; background-color: white"><img id="_ctl0_ContentPlaceHolder1_ucESSOPanel_imgVehicles" src="Images/minus.gif" border="0" /></span></a><a onmousedown="toggleDiv('_ctl0_ContentPlaceHolder1_ucESSOPanel_vehicles');" href="javascript:void(0);">Registered Vehicles&nbsp;<span id="_ctl0_ContentPlaceHolder1_ucESSOPanel_lblVehicleCount">(1 vehicle found)</span></a>
        </legend>
        <div id="_ctl0_ContentPlaceHolder1_ucESSOPanel_vehicles" style="display:block;visibility:visible;">
            <div id="vrn-search-controls" style="display: none; visibility: hidden; padding-bottom: 10px">
                <label for="VRN">
                    VRN:</label>
                <input name="_ctl0:ContentPlaceHolder1:ucESSOPanel:tbxVRN" type="text" id="_ctl0_ContentPlaceHolder1_ucESSOPanel_tbxVRN" disabled="disabled" />&nbsp;
                <input type="submit" name="_ctl0:ContentPlaceHolder1:ucESSOPanel:btnVRNTxnSearch" value="Search Tranasction" id="_ctl0_ContentPlaceHolder1_ucESSOPanel_btnVRNTxnSearch" disabled="disabled" class="button" />&nbsp;
                <input type="submit" name="_ctl0:ContentPlaceHolder1:ucESSOPanel:btnVRNDetailSearch" value="Search Vehicle Details" id="_ctl0_ContentPlaceHolder1_ucESSOPanel_btnVRNDetailSearch" disabled="disabled" class="button" />&nbsp;
                <span controltovalidate="_ctl0_ContentPlaceHolder1_ucESSOPanel_tbxVRN" errormessage="Please enter a valid VRN." enabled="False" id="_ctl0_ContentPlaceHolder1_ucESSOPanel_reqfldvalVRN" evaluationfunction="RequiredFieldValidatorEvaluateIsValid" initialvalue="" style="color:Red;visibility:hidden;">Please enter a valid VRN.</span></div>
            <!-- vrn-search-controls -->
            <table class="portlet" cellspacing="0" cellpadding="5" rules="all" border="1" id="_ctl0_ContentPlaceHolder1_ucESSOPanel_dgridVehicleList" style="border-collapse:collapse;">
			<tr class="portlet-subheader" align="center" valign="bottom" style="font-weight:bold;">
				<td>Details</td><td>Type</td><td>Status</td><td>Ration<br />Limit<br />(L/month)</td><td>Ration<br />Available<br />(L)</td><td>Exp. Date</td><td>Transactions</td>
			</tr><tr valign="top">
				<td nowrap="nowrap" align="center">
                            <a id="_ctl0_ContentPlaceHolder1_ucESSOPanel_dgridVehicleList__ctl2_lnkbtnDetails" href="javascript:__doPostBack(&#39;_ctl0$ContentPlaceHolder1$ucESSOPanel$dgridVehicleList$_ctl2$lnkbtnDetails&#39;,&#39;&#39;)">S AB1234</a>
                        </td><td>
                            <span id="_ctl0_ContentPlaceHolder1_ucESSOPanel_dgridVehicleList__ctl2_lblType">POV</span>
                        </td><td>
                            <span id="_ctl0_ContentPlaceHolder1_ucESSOPanel_dgridVehicleList__ctl2_lblVRNStat">Active</span>
                        </td><td align="right">
                            <span id="_ctl0_ContentPlaceHolder1_ucESSOPanel_dgridVehicleList__ctl2_lblRationLimit">543.21</span>
                        </td><td align="right">
                            <span id="_ctl0_ContentPlaceHolder1_ucESSOPanel_dgridVehicleList__ctl2_lblRationAvailable">123.45</span>
                        </td><td nowrap="nowrap" align="right">
                            <span id="_ctl0_ContentPlaceHolder1_ucESSOPanel_dgridVehicleList__ctl2_lblExpirationDate">22 Nov 2063</span>
                        </td><td align="center">
                            <a id="_ctl0_ContentPlaceHolder1_ucESSOPanel_dgridVehicleList__ctl2_lnkbtnTransactions" href="javascript:__doPostBack(&#39;_ctl0$ContentPlaceHolder1$ucESSOPanel$dgridVehicleList$_ctl2$lnkbtnTransactions&#39;,&#39;&#39;)">View</a>
                        </td>
			</tr>
		</table>
            <div id="_ctl0_ContentPlaceHolder1_ucESSOPanel_pnlVehiclePagingControls">
			
                <p>
                    <span id="_ctl0_ContentPlaceHolder1_ucESSOPanel_lblVehiclePageIndicator">Page 1</span>&nbsp;&nbsp;
                    <input type="submit" name="_ctl0:ContentPlaceHolder1:ucESSOPanel:btnPrevVehicles" value="Prev" id="_ctl0_ContentPlaceHolder1_ucESSOPanel_btnPrevVehicles" disabled="disabled" class="button" />&nbsp;&nbsp;
                    <input type="submit" name="_ctl0:ContentPlaceHolder1:ucESSOPanel:btnNextVehicles" value="Next" id="_ctl0_ContentPlaceHolder1_ucESSOPanel_btnNextVehicles" disabled="disabled" class="button" /></p>
            
		</div>
            <!-- pnlVehiclePagingControls -->
        </div>
        <!-- vehicles -->
    </fieldset>

	</div>
<!-- pnlESSOPanel -->
<!-- Transaction list -->

<!-- pnlTransactions -->
<!-- Vehicle details -->

<!-- pnlVehicleDetail -->
	
</div>

            
<hr size="1" />
<div class="mainfoot">
    ® The Exchange is a registered trademark of The Exchange. The Exchange Web site
    is an unofficial Department of Defense (DoD) Web site published and maintained by
    The Exchange with non-appropriated funds.
    <p class="mainfoot">
        <a class="mainfoot" href="http://www.shopmyexchange.aafes.com/AboutExchange/PublicAffairs/trademark.htm">
            The Exchange Trademark / Service Marks</a>
    </p>
</div>

        
<script type="text/javascript">
<!--
var Page_Validators =  new Array(document.getElementById("_ctl0_ContentPlaceHolder1_ucESSOPanel_reqfldvalVRN"));
// -->
</script>

<script language="JavaScript" type="text/javascript">
function toggleDiv(id)
{
var imgImage = "";
var imgPlus = "Images/plus.gif";
var imgMinus = "Images/minus.gif";
var strAltText = "";
var strAltTextPlus = "Click to expand section.";
var strAltTextMinus = "Click to collapse section.";
var objAccountInfoImage;
var objVehiclesImage;
var objTransactionsImage;
var objVehicleDetailsImage;
var objCardImage;
if (document.getElementById(id).style.display == "none")
{
document.getElementById(id).style.display = "block";
document.getElementById(id).style.visibility = "visible";
imgImage = imgMinus;
strAltText = strAltTextMinus;
}
else
{
document.getElementById(id).style.display = "none";
document.getElementById(id).style.visibility = "hidden";
imgImage = imgPlus;
strAltText = strAltTextPlus;
}
switch (id)
{
case "_ctl0_ContentPlaceHolder1_ucESSOPanel_account_info":
objAccountInfoImage = document.getElementById("_ctl0_ContentPlaceHolder1_ucESSOPanel_imgAccountInfo");
objAccountInfoImage.src = imgImage;
objAccountInfoImage.alt = strAltText;
objAccountInfoImage.title = strAltText;
break;
case "_ctl0_ContentPlaceHolder1_ucESSOPanel_vehicles":
objVehiclesImage = document.getElementById("_ctl0_ContentPlaceHolder1_ucESSOPanel_imgVehicles");
objVehiclesImage.src = imgImage;
objVehiclesImage.alt = strAltText;
objVehiclesImage.title = strAltText;
break;
case "_ctl0_ContentPlaceHolder1_ucESSOPanel_transactions":
objTransactionsImage = document.getElementById("_ctl0_ContentPlaceHolder1_ucESSOPanel_imgTransactions");
objTransactionsImage.src = imgImage;
objTransactionsImage.alt = strAltText;
objTransactionsImage.title = strAltText;
break;
case "_ctl0_ContentPlaceHolder1_ucESSOPanel_vehicle_details":
objVehicleDetailsImage = document.getElementById("_ctl0_ContentPlaceHolder1_ucESSOPanel_imgVehicleDetails");
objVehicleDetailsImage.src = imgImage;
objVehicleDetailsImage.alt = strAltText;
objVehicleDetailsImage.title = strAltText;
break;default:
objCardImage = document.getElementById(id + "_image");
objCardImage.src = imgImage;
objCardImage.alt = strAltText;
objCardImage.title = strAltText;
}
// Set value of corresponding hidden variable, but not for the small
// ESSO card panels.  The reason for this is that the hidden variables
// are added by hand and not programmatically.  Each ESSO card is
// contained within a programmatically-generated div, and there can
// be as many as 25 cards displayed per vehicle.
if (id.indexOf("card") == -1)
{
var objHiddenVariable = document.getElementById(id + "_state")
if ((objHiddenVariable != null) || (objHiddenVariable != "undefined") || (objHiddenVariable) || (objHiddenVariable != "NaN"))
{
if (document.getElementById(id).style.display == "none")
{
objHiddenVariable.value = "Off";
// alert(objHiddenVariable.name + " hidden variable set to Off");
}
else
{
objHiddenVariable.value = "On";
// alert(objHiddenVariable.name + " hidden variable set to On");
}
}
}
}
// This function will disable the Enter/Return key.
// Attach the event to the form like this:
// onkeypress="return noenter();"
function noenter()
{
return !(window.event && window.event.keyCode == 13);
}
</script>

<script type="text/javascript">
<!--

var Page_ValidationActive = false;
if (typeof(ValidatorOnLoad) == "function") {
    ValidatorOnLoad();
}

function ValidatorOnSubmit() {
    if (Page_ValidationActive) {
        return ValidatorCommonOnSubmit();
    }
    else {
        return true;
    }
}
        // -->
</script>
</form>
</body>
</html>
""";

void main() {
  final document = parse(testPage);
  Car knownGood = Car();
  knownGood.vrn = "S AB1234";
  knownGood.type = "POV";
  knownGood.status = "Active";
  knownGood.ration = "543.21";
  knownGood.rationRemaining = "123.45";
  knownGood.expDate = "22 Nov 2063";

  group('vehicle_parsing', () {
    List cars = EssoData.getCars(document);

    test('Returns the expected registration number', () {
      expect(cars[0].vrn, knownGood.vrn);
    });
    test('Returns the expected vehicle type', () {
      expect(cars[0].type, knownGood.type);
    });
    test('Returns the expected vehicle status', () {
      expect(cars[0].status, knownGood.status);
    });
    test('Returns the expected ration limit', () {
      expect(cars[0].ration, knownGood.ration);
    });
    test('Returns the expected ration remaining', () {
      expect(cars[0].rationRemaining, knownGood.rationRemaining);
    });
    test('Returns the expected expiration date', () {
      expect(cars[0].expDate, knownGood.expDate);
    });
  });

  String expectedBalance = r'$3.50';
  group('balance_parsing', () {
    test('Returns the expected balance', () {
      expect(EssoData.getBalance(document), expectedBalance);
    });
  });
}
