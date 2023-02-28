# frozen_string_literal: true
# require 'net/smtp'
# require 'erb'
class NotificationGenerator
  # This class sends notifications to user using SMTP Protocol
  # @author Jan Hummel, Carlo Bortolan

  # @param [String] employer_name Name des Arbeitgebers
  # @param [String] employer_email E-Mail des Arbeitgebers
  # @param [String] applicant_name Name des Bewerbers
  # @param [String] applicant_email E-Mail des Bewerbers
  # @param [int] applicant_id ID des Bewerbers
  # @param [int] job_id Job
  # @param [DateTime] applied_at Datum und Uhrzeit der Bewerbung
  # @param [String] content Bewerbungsschreiben
  # @param [String] documents Link zu den Bewerbungsunterlagen
  # @return [void]
  def send_notification_employer(employer_name, employer_email, applicant_name, applicant_email, user_id, job_id, applied_at, content = "", documents = "")
    puts "sending email to #{employer_email}, #{applicant_name}, #{job_id}"
    msg = <<MESSAGE_END
From: Support V&I <noreply.versuchundirrtum@gmail.com>
To: #{employer_name} <#{employer_email}>
MIME-Version: 1.0
Content-type: text/html
Subject: New application for job ##{job_id}
Content-Type: text/html; charset="utf-8"; format="fixed"
Content-Transfer-Encoding: quoted-printable

<!doctype html>
<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office">
    <head>
        <!-- NAME: ART NEWSLETTER -->
        <!--[if gte mso 15]>
        <xml>
            <o:OfficeDocumentSettings>
            <o:AllowPNG/>
            <o:PixelsPerInch>96</o:PixelsPerInch>
            </o:OfficeDocumentSettings>
        </xml>
        <![endif]-->
        <meta charset=3D"UTF-8">
        <meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
        <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-sc=
ale=3D1">
        <title>*|MC:SUBJECT|*</title>
       =20
    <style type=3D"text/css">
=09=09p{
=09=09=09margin:10px 0;
=09=09=09padding:0;
=09=09}
=09=09table{
=09=09=09border-collapse:collapse;
=09=09}
=09=09h1,h2,h3,h4,h5,h6{
=09=09=09display:block;
=09=09=09margin:0;
=09=09=09padding:0;
=09=09}
=09=09img,a img{
=09=09=09border:0;
=09=09=09height:auto;
=09=09=09outline:none;
=09=09=09text-decoration:none;
=09=09}
=09=09body,#bodyTable,#bodyCell{
=09=09=09height:100%;
=09=09=09margin:0;
=09=09=09padding:0;
=09=09=09width:100%;
=09=09}
=09=09.mcnPreviewText{
=09=09=09display:none !important;
=09=09}
=09=09#outlook a{
=09=09=09padding:0;
=09=09}
=09=09img{
=09=09=09-ms-interpolation-mode:bicubic;
=09=09}
=09=09table{
=09=09=09mso-table-lspace:0pt;
=09=09=09mso-table-rspace:0pt;
=09=09}
=09=09.ReadMsgBody{
=09=09=09width:100%;
=09=09}
=09=09.ExternalClass{
=09=09=09width:100%;
=09=09}
=09=09p,a,li,td,blockquote{
=09=09=09mso-line-height-rule:exactly;
=09=09}
=09=09a[href^=3Dtel],a[href^=3Dsms]{
=09=09=09color:inherit;
=09=09=09cursor:default;
=09=09=09text-decoration:none;
=09=09}
=09=09p,a,li,td,body,table,blockquote{
=09=09=09-ms-text-size-adjust:100%;
=09=09=09-webkit-text-size-adjust:100%;
=09=09}
=09=09.ExternalClass,.ExternalClass p,.ExternalClass td,.ExternalClass div,=
.ExternalClass span,.ExternalClass font{
=09=09=09line-height:100%;
=09=09}
=09=09a[x-apple-data-detectors]{
=09=09=09color:inherit !important;
=09=09=09text-decoration:none !important;
=09=09=09font-size:inherit !important;
=09=09=09font-family:inherit !important;
=09=09=09font-weight:inherit !important;
=09=09=09line-height:inherit !important;
=09=09}
=09=09.templateContainer{
=09=09=09max-width:600px !important;
=09=09}
=09=09a.mcnButton{
=09=09=09display:block;
=09=09}
=09=09.mcnImage,.mcnRetinaImage{
=09=09=09vertical-align:bottom;
=09=09}
=09=09.mcnTextContent{
=09=09=09word-break:break-word;
=09=09}
=09=09.mcnTextContent img{
=09=09=09height:auto !important;
=09=09}
=09=09.mcnDividerBlock{
=09=09=09table-layout:fixed !important;
=09=09}
=09=09h1{
=09=09=09color:#FFFFFF;
=09=09=09font-family:'Noticia Text', Georgia, 'Times New Roman', serif;
=09=09=09font-size:48px;
=09=09=09font-style:normal;
=09=09=09font-weight:bold;
=09=09=09line-height:150%;
=09=09=09letter-spacing:normal;
=09=09=09text-align:center;
=09=09}
=09=09h2{
=09=09=09color:#1F2F38;
=09=09=09font-family:'Noticia Text', Georgia, 'Times New Roman', serif;
=09=09=09font-size:48px;
=09=09=09font-style:normal;
=09=09=09font-weight:bold;
=09=09=09line-height:150%;
=09=09=09letter-spacing:normal;
=09=09=09text-align:center;
=09=09}
=09=09h3{
=09=09=09color:#1F2F38;
=09=09=09font-family:'Noticia Text', Georgia, 'Times New Roman', serif;
=09=09=09font-size:36px;
=09=09=09font-style:normal;
=09=09=09font-weight:bold;
=09=09=09line-height:150%;
=09=09=09letter-spacing:normal;
=09=09=09text-align:center;
=09=09}
=09=09h4{
=09=09=09color:#435864;
=09=09=09font-family:'Noticia Text', Georgia, 'Times New Roman', serif;
=09=09=09font-size:22px;
=09=09=09font-style:italic;
=09=09=09font-weight:normal;
=09=09=09line-height:125%;
=09=09=09letter-spacing:normal;
=09=09=09text-align:center;
=09=09}
=09=09#templateHeader{
=09=09=09background-color:#005293;
#{ # BILD OBEN
    }
=09=09=09background-image:url("https://mcusercontent.com/8d764482dffdf18e05=
7bac1bc/images/6e232492-0388-1933-0ab9-e3604f3bfe22.jpg");
=09=09=09background-repeat:no-repeat;
=09=09=09background-position:center;
=09=09=09background-size:cover;
=09=09=09border-top:0;
=09=09=09border-bottom:0;
=09=09=09padding-top:69px;
=09=09=09padding-bottom:69px;
=09=09}
=09=09.headerContainer{
=09=09=09background-color:#transparent;
=09=09=09background-image:none;
=09=09=09background-repeat:no-repeat;
=09=09=09background-position:center;
=09=09=09background-size:cover;
=09=09=09border-top:0;
=09=09=09border-bottom:0;
=09=09=09padding-top:0px;
=09=09=09padding-bottom:0px;
=09=09}
=09=09.headerContainer .mcnTextContent,.headerContainer .mcnTextContent p{
=09=09=09color:#FFFFFF;
=09=09=09font-family:'Noticia Text', Georgia, 'Times New Roman', serif;
=09=09=09font-size:18px;
=09=09=09line-height:150%;
=09=09=09text-align:center;
=09=09}
=09=09.headerContainer .mcnTextContent a,.headerContainer .mcnTextContent p=
 a{
=09=09=09color:#FFFFFF;
=09=09=09font-weight:normal;
=09=09=09text-decoration:underline;
=09=09}
=09=09#templateBody{
=09=09=09background-color:#ffffff;
=09=09=09background-image:none;
=09=09=09background-repeat:no-repeat;
=09=09=09background-position:center;
=09=09=09background-size:cover;
=09=09=09border-top:0;
=09=09=09border-bottom:0;
=09=09=09padding-top:72px;
=09=09=09padding-bottom:9px;
=09=09}
=09=09.bodyContainer{
=09=09=09background-color:#transparent;
=09=09=09background-image:none;
=09=09=09background-repeat:no-repeat;
=09=09=09background-position:center;
=09=09=09background-size:cover;
=09=09=09border-top:0;
=09=09=09border-bottom:0;
=09=09=09padding-top:0;
=09=09=09padding-bottom:0;
=09=09}
=09=09.bodyContainer .mcnTextContent,.bodyContainer .mcnTextContent p{
=09=09=09color:#202020;
=09=09=09font-family:'Noticia Text', Georgia, 'Times New Roman', serif;
=09=09=09font-size:18px;
=09=09=09line-height:150%;
=09=09=09text-align:left;
=09=09}
=09=09.bodyContainer .mcnTextContent a,.bodyContainer .mcnTextContent p a{
=09=09=09color:#DE5B49;
=09=09=09font-weight:normal;
=09=09=09text-decoration:underline;
=09=09}
=09=09#templateUpperColumns{
=09=09=09background-color:#FFFFFF;
=09=09=09background-image:none;
=09=09=09background-repeat:no-repeat;
=09=09=09background-position:center;
=09=09=09background-size:cover;
=09=09=09border-top:0;
=09=09=09border-bottom:0;
=09=09=09padding-top:9px;
=09=09=09padding-bottom:90px;
=09=09}
=09=09#templateUpperColumns .columnContainer{
=09=09=09background-color:transparent;
=09=09=09background-image:none;
=09=09=09background-repeat:no-repeat;
=09=09=09background-position:center;
=09=09=09background-size:cover;
=09=09=09border-top:0;
=09=09=09border-bottom:0;
=09=09=09padding-top:0;
=09=09=09padding-bottom:0;
=09=09}
=09=09#templateUpperColumns .columnContainer .mcnTextContent,#templateUpper=
Columns .columnContainer .mcnTextContent p{
=09=09=09color:#202020;
=09=09=09font-family:'Noticia Text', Georgia, 'Times New Roman', serif;
=09=09=09font-size:16px;
=09=09=09line-height:150%;
=09=09=09text-align:left;
=09=09}
=09=09#templateUpperColumns .columnContainer .mcnTextContent a,#templateUpp=
erColumns .columnContainer .mcnTextContent p a{
=09=09=09color:#DE5B49;
=09=09=09font-weight:normal;
=09=09=09text-decoration:underline;
=09=09}
=09=09#templateLowerColumns{
=09=09=09background-color:#CDDCE4;
#{ # UNNÖTIG 1
    #=09=09=09background-image:url("https://mcusercontent.com/8d764482dffdf18e05=
    # 7bac1bc/images/fbcffd08-4ad7-cde6-2f8d-cfdf5c415fc3.jpg");
    }
=09=09=09background-repeat:no-repeat;
=09=09=09background-position:center;
=09=09=09background-size:cover;
=09=09=09border-top:0;
=09=09=09border-bottom:0;
=09=09=09padding-top:0px;
=09=09=09padding-bottom:0px;
=09=09}
=09=09#templateLowerColumns .columnContainer{
=09=09=09background-color:transparent;
=09=09=09background-image:none;
=09=09=09background-repeat:no-repeat;
=09=09=09background-position:center;
=09=09=09background-size:cover;
=09=09=09border-top:0;
=09=09=09border-bottom:0;
=09=09=09padding-top:0;
=09=09=09padding-bottom:0;
=09=09}
=09=09.lowerColumnHeaderContainer .mcnTextContent,.lowerColumnHeaderContain=
er .mcnTextContent p{
=09=09=09color:#202020;
=09=09=09font-family:'Noticia Text', Georgia, 'Times New Roman', serif;
=09=09=09font-size:18px;
=09=09=09line-height:150%;
=09=09=09text-align:left;
=09=09}
=09=09.lowerColumnHeaderContainer .mcnTextContent a,.lowerColumnHeaderConta=
iner .mcnTextContent p a{
=09=09=09color:#DE5B49;
=09=09=09font-weight:normal;
=09=09=09text-decoration:underline;
=09=09}
=09=09#templateLowerColumns .columnContainer .mcnTextContent,#templateLower=
Columns .columnContainer .mcnTextContent p{
=09=09=09color:#202020;
=09=09=09font-family:'Noticia Text', Georgia, 'Times New Roman', serif;
=09=09=09font-size:18px;
=09=09=09line-height:150%;
=09=09=09text-align:left;
=09=09}
=09=09#templateLowerColumns .columnContainer .mcnTextContent a,#templateLow=
erColumns .columnContainer .mcnTextContent p a{
=09=09=09color:#DE5B49;
=09=09=09font-weight:normal;
=09=09=09text-decoration:underline;
=09=09}
=09=09#templateFooter{
=09=09=09background-color:#005293;
=09=09=09background-image:none;
=09=09=09background-repeat:no-repeat;
=09=09=09background-position:center;
=09=09=09background-size:cover;
=09=09=09border-top:0;
=09=09=09border-bottom:0;
=09=09=09padding-top:46px;
=09=09=09padding-bottom:46px;
=09=09}
=09=09.footerContainer{
=09=09=09background-color:transparent;
=09=09=09background-image:none;
=09=09=09background-repeat:no-repeat;
=09=09=09background-position:center;
=09=09=09background-size:cover;
=09=09=09border-top:0;
=09=09=09border-bottom:0;
=09=09=09padding-top:0;
=09=09=09padding-bottom:0;
=09=09}
=09=09.footerContainer .mcnTextContent,.footerContainer .mcnTextContent p{
=09=09=09color:#FFFFFF;
=09=09=09font-family:Helvetica;
=09=09=09font-size:12px;
=09=09=09line-height:150%;
=09=09=09text-align:center;
=09=09}
=09=09.footerContainer .mcnTextContent a,.footerContainer .mcnTextContent p=
 a{
=09=09=09color:#FFFFFF;
=09=09=09font-weight:normal;
=09=09=09text-decoration:underline;
=09=09}
=09@media only screen and (max-width: 480px){
=09=09.columnWrapper{
=09=09=09max-width:100% !important;
=09=09=09width:100% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09body,table,td,p,a,li,blockquote{
=09=09=09-webkit-text-size-adjust:none !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09body{
=09=09=09width:100% !important;
=09=09=09min-width:100% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.mcnRetinaImage{
=09=09=09max-width:100% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.mcnImage{
=09=09=09width:100% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.mcnCartContainer,.mcnCaptionTopContent,.mcnRecContentContainer,.mcnC=
aptionBottomContent,.mcnTextContentContainer,.mcnBoxedTextContentContainer,=
.mcnImageGroupContentContainer,.mcnCaptionLeftTextContentContainer,.mcnCapt=
ionRightTextContentContainer,.mcnCaptionLeftImageContentContainer,.mcnCapti=
onRightImageContentContainer,.mcnImageCardLeftTextContentContainer,.mcnImag=
eCardRightTextContentContainer,.mcnImageCardLeftImageContentContainer,.mcnI=
mageCardRightImageContentContainer{
=09=09=09max-width:100% !important;
=09=09=09width:100% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.mcnBoxedTextContentContainer{
=09=09=09min-width:100% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.mcnImageGroupContent{
=09=09=09padding:9px !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.mcnCaptionLeftContentOuter .mcnTextContent,.mcnCaptionRightContentOu=
ter .mcnTextContent{
=09=09=09padding-top:9px !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.mcnImageCardTopImageContent,.mcnCaptionBottomContent:last-child .mcn=
CaptionBottomImageContent,.mcnCaptionBlockInner .mcnCaptionTopContent:last-=
child .mcnTextContent{
=09=09=09padding-top:18px !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.mcnImageCardBottomImageContent{
=09=09=09padding-bottom:9px !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.mcnImageGroupBlockInner{
=09=09=09padding-top:0 !important;
=09=09=09padding-bottom:0 !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.mcnImageGroupBlockOuter{
=09=09=09padding-top:9px !important;
=09=09=09padding-bottom:9px !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.mcnTextContent,.mcnBoxedTextContentColumn{
=09=09=09padding-right:18px !important;
=09=09=09padding-left:18px !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.mcnImageCardLeftImageContent,.mcnImageCardRightImageContent{
=09=09=09padding-right:18px !important;
=09=09=09padding-bottom:0 !important;
=09=09=09padding-left:18px !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.mcpreview-image-uploader{
=09=09=09display:none !important;
=09=09=09width:100% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09h1{
=09=09=09font-size:36px !important;
=09=09=09line-height:125% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09h2{
=09=09=09font-size:30px !important;
=09=09=09line-height:125% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09h3{
=09=09=09font-size:26px !important;
=09=09=09line-height:150% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09h4{
=09=09=09font-size:22px !important;
=09=09=09line-height:150% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.mcnBoxedTextContentContainer .mcnTextContent,.mcnBoxedTextContentCon=
tainer .mcnTextContent p{
=09=09=09font-size:14px !important;
=09=09=09line-height:150% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.headerContainer .mcnTextContent,.headerContainer .mcnTextContent p{
=09=09=09font-size:16px !important;
=09=09=09line-height:150% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.bodyContainer .mcnTextContent,.bodyContainer .mcnTextContent p{
=09=09=09font-size:16px !important;
=09=09=09line-height:150% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09#templateUpperColumns .columnContainer .mcnTextContent,#templateUpper=
Columns .columnContainer .mcnTextContent p{
=09=09=09font-size:16px !important;
=09=09=09line-height:150% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.lowerColumnHeaderContainer .mcnTextContent,.lowerColumnHeaderContain=
er .mcnTextContent p{
=09=09=09font-size:16px !important;
=09=09=09line-height:150% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09#templateLowerColumns .columnContainer .mcnTextContent,#templateLower=
Columns .columnContainer .mcnTextContent p{
=09=09=09font-size:16px !important;
=09=09=09line-height:150% !important;
=09=09}

}=09@media only screen and (max-width: 480px){
=09=09.footerContainer .mcnTextContent,.footerContainer .mcnTextContent p{
=09=09=09font-size:14px !important;
=09=09=09line-height:150% !important;
=09=09}

}</style><!--[if !mso]><!--><link href=3D"https://fonts.googleapis.com/css?=
family=3DNoticia+Text:400,400i,700,700i" rel=3D"stylesheet"><!--<![endif]--=
></head>
    <body style=3D"height: 100%;margin: 0;padding: 0;width: 100%;-ms-text-s=
ize-adjust: 100%;-webkit-text-size-adjust: 100%;">
        <!--*|IF:MC_PREVIEW_TEXT|*-->
        <!--[if !gte mso 9]><!----><span class=3D"mcnPreviewText" style=3D"=
display:none; font-size:0px; line-height:0px; max-height:0px; max-width:0px=
; opacity:0; overflow:hidden; visibility:hidden; mso-hide:all;">*NEW APPLICATION*</span>
        <!--<![endif]-->
        <!--*|END:IF|*-->
        <center>
            <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspac=
ing=3D"0" height=3D"100%" width=3D"100%" id=3D"bodyTable" style=3D"border-c=
ollapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size=
-adjust: 100%;-webkit-text-size-adjust: 100%;height: 100%;margin: 0;padding=
: 0;width: 100%;">
                <tr>
                    <td align=3D"center" valign=3D"top" id=3D"bodyCell" sty=
le=3D"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text=
-size-adjust: 100%;height: 100%;margin: 0;padding: 0;width: 100%;">
                        <!-- BEGIN TEMPLATE // -->
                        <table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" width=3D"100%" style=3D"border-collapse: collapse;mso-table-lspace: =
0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adju=
st: 100%;">
                            <tr>
                                <td align=3D"center" valign=3D"top" id=3D"t=
emplateHeader" data-template-container=3D"" style=3D"background:#005293 url=
(&quot;=
 #{# UNNÖTIG 2
    # https://mcusercontent.com/8d764482dffdf18e057bac1bc/images/6e232492-0388-1933-0ab9-e3604f3bfe22.jpg=
    }   
&quot;)no-repeat center/cover;mso-line-heig=
ht-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;=
background-color: #005293;background-image: url(=
#{ # UNNÖTIG 3
    # https://mcusercontent.com/8=
    # d764482dffdf18e057bac1bc/images/6e232492-0388-1933-0ab9-e3604f3bfe22.jpg
    }
);b=
ackground-repeat: no-repeat;background-position: center;background-size: co=
ver;border-top: 0;border-bottom: 0;padding-top: 69px;padding-bottom: 69px;"=
>
                                    <!--[if (gte mso 9)|(IE)]>
                                    <table align=3D"center" border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0" width=3D"600" style=3D"width:600px;">
                                    <tr>
                                    <td align=3D"center" valign=3D"top" wid=
th=3D"600" style=3D"width:600px;">
                                    <![endif]-->
                                    <table align=3D"center" border=3D"0" ce=
llpadding=3D"0" cellspacing=3D"0" width=3D"100%" class=3D"templateContainer=
" style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace=
: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;max-width: =
600px !important;">
                                        <tr>
                                            <td valign=3D"top" class=3D"hea=
derContainer" style=3D"background:#transparent none no-repeat center/cover;=
mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-=
adjust: 100%;background-color: #transparent;background-image: none;backgrou=
nd-repeat: no-repeat;background-position: center;background-size: cover;bor=
der-top: 0;border-bottom: 0;padding-top: 0px;padding-bottom: 0px;"><table c=
lass=3D"mcnImageBlock" style=3D"min-width: 100%;border-collapse: collapse;m=
so-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webk=
it-text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"0" cellpadding=3D=
"0" border=3D"0">
    <tbody class=3D"mcnImageBlockOuter">
            <tr>
                <td style=3D"padding: 9px;mso-line-height-rule: exactly;-ms=
-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnImageB=
lockInner" valign=3D"top">
                    <table class=3D"mcnImageContentContainer" style=3D"min-=
width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspac=
e: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width=3D=
"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D"left">
                        <tbody><tr>
                            <td class=3D"mcnImageContent" style=3D"padding-=
right: 9px;padding-left: 9px;padding-top: 0;padding-bottom: 0;text-align: c=
enter;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text=
-size-adjust: 100%;" valign=3D"top">
#{ # UNNÖTIG 3 
    #                                =20
    #                                    =20
    # <img alt=3D"" src=3D"https://mcuser=
    # content.com/8d764482dffdf18e057bac1bc/images/6db60d6f-f535-cc2d-c36a-d3fd44=
    # 7c8f98.png" style=3D"max-width: 1014px;padding-bottom: 0px;display: inline =
    # !important;vertical-align: bottom;border-radius: 0%;border: 0;height: auto;=
    # outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;" class=
    # =3D"mcnImage" width=3D"564" align=3D"middle">
    # =20
    # =20
    }
                            </td>
                        </tr>
                    </tbody></table>
                </td>
            </tr>
    </tbody>
</table><table class=3D"mcnTextBlock" style=3D"min-width: 100%;border-colla=
pse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adj=
ust: 100%;-webkit-text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"0"=
 cellpadding=3D"0" border=3D"0">
    <tbody class=3D"mcnTextBlockOuter">
        <tr>
            <td class=3D"mcnTextBlockInner" style=3D"padding-top: 9px;mso-l=
ine-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjus=
t: 100%;" valign=3D"top">
              =09<!--[if mso]>
=09=09=09=09<table align=3D"left" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0" width=3D"100%" style=3D"width:100%;">
=09=09=09=09<tr>
=09=09=09=09<![endif]-->
=09=09=09   =20
=09=09=09=09<!--[if mso]>
=09=09=09=09<td valign=3D"top" width=3D"600" style=3D"width:600px;">
=09=09=09=09<![endif]-->
                <table style=3D"max-width: 100%;min-width: 100%;border-coll=
apse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-ad=
just: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnTextContentContaine=
r" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D=
"left">
                    <tbody><tr>
                       =20
                        <td class=3D"mcnTextContent" style=3D"padding-top: =
0;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;mso-line-heigh=
t-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;w=
ord-break: break-word;color: #FFFFFF;font-family: 'Noticia Text', Georgia, =
'Times New Roman', serif;font-size: 18px;line-height: 150%;text-align: cent=
er;" valign=3D"top">
                       =20
                            <h1 style=3D"display: block;margin: 0;padding: =
0;color: #FFFFFF;font-family: 'Noticia Text', Georgia, 'Times New Roman', s=
erif;font-size: 48px;font-style: normal;font-weight: bold;line-height: 150%=
;letter-spacing: normal;text-align: center;"><span style=3D"color:#e37222">=
#{applicant_name} </span>has applied for job ##{job_id}</h1>

                        </td>
                    </tr>
                </tbody></table>
=09=09=09=09<!--[if mso]>
=09=09=09=09</td>
=09=09=09=09<![endif]-->
               =20
=09=09=09=09<!--[if mso]>
=09=09=09=09</tr>
=09=09=09=09</table>
=09=09=09=09<![endif]-->
            </td>
        </tr>
    </tbody>
</table></td>
                                        </tr>
                                    </table>
                                <!--[if (gte mso 9)|(IE)]>
                                </td>
                                </tr>
                                </table>
                                <![endif]-->
                                </td>
                            </tr>
                            <tr>
                                <td align=3D"center" valign=3D"top" id=3D"t=
emplateBody" data-template-container=3D"" style=3D"background:#ffffff none =
no-repeat center/cover;mso-line-height-rule: exactly;-ms-text-size-adjust: =
100%;-webkit-text-size-adjust: 100%;background-color: #ffffff;background-im=
age: none;background-repeat: no-repeat;background-position: center;backgrou=
nd-size: cover;border-top: 0;border-bottom: 0;padding-top: 72px;padding-bot=
tom: 9px;">
                                    <!--[if (gte mso 9)|(IE)]>
                                    <table align=3D"center" border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0" width=3D"600" style=3D"width:600px;">
                                    <tr>
                                    <td align=3D"center" valign=3D"top" wid=
th=3D"600" style=3D"width:600px;">
                                    <![endif]-->
                                    <table align=3D"center" border=3D"0" ce=
llpadding=3D"0" cellspacing=3D"0" width=3D"100%" class=3D"templateContainer=
" style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace=
: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;max-width: =
600px !important;">
                                        <tr>
                                            <td valign=3D"top" class=3D"bod=
yContainer" style=3D"background:#transparent none no-repeat center/cover;ms=
o-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-ad=
just: 100%;background-color: #transparent;background-image: none;background=
-repeat: no-repeat;background-position: center;background-size: cover;borde=
r-top: 0;border-bottom: 0;padding-top: 0;padding-bottom: 0;"><table class=
=3D"mcnTextBlock" style=3D"min-width: 100%;border-collapse: collapse;mso-ta=
ble-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-te=
xt-size-adjust: 100%;" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" b=
order=3D"0">
    <tbody class=3D"mcnTextBlockOuter">
        <tr>
            <td class=3D"mcnTextBlockInner" style=3D"padding-top: 9px;mso-l=
ine-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjus=
t: 100%;" valign=3D"top">
              =09<!--[if mso]>
=09=09=09=09<table align=3D"left" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0" width=3D"100%" style=3D"width:100%;">
=09=09=09=09<tr>
=09=09=09=09<![endif]-->
=09=09=09   =20
=09=09=09=09<!--[if mso]>
=09=09=09=09<td valign=3D"top" width=3D"600" style=3D"width:600px;">
=09=09=09=09<![endif]-->
                <table style=3D"max-width: 100%;min-width: 100%;border-coll=
apse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-ad=
just: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnTextContentContaine=
r" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D=
"left">
                    <tbody><tr>
                       =20
                        <td class=3D"mcnTextContent" style=3D"padding-top: =
0;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;mso-line-heigh=
t-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;w=
ord-break: break-word;color: #202020;font-family: 'Noticia Text', Georgia, =
'Times New Roman', serif;font-size: 18px;line-height: 150%;text-align: left=
;" valign=3D"top">
                       =20
                            <span style=3D"font-size:18px"><strong>You rece=
ived a new application for job <em>##{job_id}</em></strong><br>
<span style=3D"color:#636367">From: </span>#{applicant_name} [<em>#{applicant_email}</em>]<br>
<span style=3D"color:#666666">At</span><span style=3D"color:#636367">: </sp=
an>#{applied_at}
#{
      unless content.eql? "" then
        "<br><span style=3D\"color:#636367\">Content: </span>#{content}";
      end}

#{
      unless documents.eql? "" then
        "<br><span style=3D\"color:#636367\">Documents: </span><a href=3D\"
https://www.versuchundirrtum.com/applicationdocuments/@id={#{documents}\" target=3D\"_blank\" style=3D\"mso-line-height-rule=
: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;color: =
#DE5B49;font-weight: normal;text-decoration: underline;\">Link to documents<=
/a></span><br>";
      end}

&nbsp;
                        </td>
                    </tr>
                </tbody></table>
=09=09=09=09<!--[if mso]>
=09=09=09=09</td>
=09=09=09=09<![endif]-->
               =20
=09=09=09=09<!--[if mso]>
=09=09=09=09</tr>
=09=09=09=09</table>
=09=09=09=09<![endif]-->
            </td>
        </tr>
    </tbody>
</table><table class=3D"mcnDividerBlock" style=3D"min-width: 100%;border-co=
llapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-=
adjust: 100%;-webkit-text-size-adjust: 100%;table-layout: fixed !important;=
" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0">
    <tbody class=3D"mcnDividerBlockOuter">
        <tr>
            <td class=3D"mcnDividerBlockInner" style=3D"min-width: 100%;pad=
ding: 54px 18px 45px;mso-line-height-rule: exactly;-ms-text-size-adjust: 10=
0%;-webkit-text-size-adjust: 100%;">
                <table class=3D"mcnDividerContent" style=3D"min-width: 100%=
;border-top: 2px solid #DE5B49;border-collapse: collapse;mso-table-lspace: =
0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adju=
st: 100%;" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0">
                    <tbody><tr>
                        <td style=3D"mso-line-height-rule: exactly;-ms-text=
-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                            <span></span>
                        </td>
                    </tr>
                </tbody></table>
<!--           =20
                <td class=3D"mcnDividerBlockInner" style=3D"padding: 18px;"=
>
                <hr class=3D"mcnDividerContent" style=3D"border-bottom-colo=
r:none; border-left-color:none; border-right-color:none; border-bottom-widt=
h:0; border-left-width:0; border-right-width:0; margin-top:0; margin-right:=
0; margin-bottom:0; margin-left:0;" />
-->
            </td>
        </tr>
    </tbody>
</table><table class=3D"mcnTextBlock" style=3D"min-width: 100%;border-colla=
pse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adj=
ust: 100%;-webkit-text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"0"=
 cellpadding=3D"0" border=3D"0">
    <tbody class=3D"mcnTextBlockOuter">
        <tr>
            <td class=3D"mcnTextBlockInner" style=3D"padding-top: 9px;mso-l=
ine-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjus=
t: 100%;" valign=3D"top">
              =09<!--[if mso]>
=09=09=09=09<table align=3D"left" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0" width=3D"100%" style=3D"width:100%;">
=09=09=09=09<tr>
=09=09=09=09<![endif]-->
=09=09=09   =20
=09=09=09=09<!--[if mso]>
=09=09=09=09<td valign=3D"top" width=3D"600" style=3D"width:600px;">
=09=09=09=09<![endif]-->
                <table style=3D"max-width: 100%;min-width: 100%;border-coll=
apse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-ad=
just: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnTextContentContaine=
r" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D=
"left">
                    <tbody><tr>
                       =20
                        <td class=3D"mcnTextContent" style=3D"padding-top: =
0;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;mso-line-heigh=
t-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;w=
ord-break: break-word;color: #202020;font-family: 'Noticia Text', Georgia, =
'Times New Roman', serif;font-size: 18px;line-height: 150%;text-align: left=
;" valign=3D"top">
                       =20
                            <h2 style=3D"display: block;margin: 0;padding: =
0;color: #1F2F38;font-family: 'Noticia Text', Georgia, 'Times New Roman', s=
erif;font-size: 48px;font-style: normal;font-weight: bold;line-height: 150%=
;letter-spacing: normal;text-align: center;">Find out more:</h2>

                        </td>
                    </tr>
                </tbody></table>
=09=09=09=09<!--[if mso]>
=09=09=09=09</td>
=09=09=09=09<![endif]-->
               =20
=09=09=09=09<!--[if mso]>
=09=09=09=09</tr>
=09=09=09=09</table>
=09=09=09=09<![endif]-->
            </td>
        </tr>
    </tbody>
</table></td>
                                        </tr>
                                    </table>
                                <!--[if (gte mso 9)|(IE)]>
                                </td>
                                </tr>
                                </table>
                                <![endif]-->
                                </td>
                            </tr>
                            <tr>
                                <td align=3D"center" valign=3D"top" id=3D"t=
emplateUpperColumns" data-template-container=3D"" style=3D"background:#FFFF=
FF none no-repeat center/cover;mso-line-height-rule: exactly;-ms-text-size-=
adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;backg=
round-image: none;background-repeat: no-repeat;background-position: center;=
background-size: cover;border-top: 0;border-bottom: 0;padding-top: 9px;padd=
ing-bottom: 90px;">
                                    <table border=3D"0" cellpadding=3D"0" c=
ellspacing=3D"0" width=3D"100%" class=3D"templateContainer" style=3D"border=
-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-si=
ze-adjust: 100%;-webkit-text-size-adjust: 100%;max-width: 600px !important;=
">
                                        <tr>
                                            <td valign=3D"top" style=3D"mso=
-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adj=
ust: 100%;">
                                                <!--[if (gte mso 9)|(IE)]>
                                                <table align=3D"center" bor=
der=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"600" style=3D"width:=
600px;">
                                                <tr>
                                                <td align=3D"center" valign=
=3D"top" width=3D"200" style=3D"width:200px;">
                                                <![endif]-->
                                                <table align=3D"left" borde=
r=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"200" class=3D"columnWr=
apper" style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-r=
space: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                    <tr>
                                                        <td valign=3D"top" =
class=3D"columnContainer" style=3D"background:transparent none no-repeat ce=
nter/cover;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit=
-text-size-adjust: 100%;background-color: transparent;background-image: non=
e;background-repeat: no-repeat;background-position: center;background-size:=
 cover;border-top: 0;border-bottom: 0;padding-top: 0;padding-bottom: 0;"><t=
able class=3D"mcnButtonBlock" style=3D"min-width: 100%;border-collapse: col=
lapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100=
%;-webkit-text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"0" cellpad=
ding=3D"0" border=3D"0">
    <tbody class=3D"mcnButtonBlockOuter">
        <tr>
            <td style=3D"padding-top: 0;padding-right: 18px;padding-bottom:=
 18px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust=
: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnButtonBlockInner" valig=
n=3D"top" align=3D"center">
                <table class=3D"mcnButtonContentContainer" style=3D"border-=
collapse: separate !important;border-radius: 4px;background-color: #4CAAD8;=
mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-web=
kit-text-size-adjust: 100%;" cellspacing=3D"0" cellpadding=3D"0" border=3D"=
0">
                    <tbody>
                        <tr>
                            <td class=3D"mcnButtonContent" style=3D"font-fa=
mily: Arial;font-size: 16px;padding: 18px;mso-line-height-rule: exactly;-ms=
-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" valign=3D"middle" =
align=3D"center">
                                <a class=3D"mcnButton " title=3D"Accept" hr=
ef=3D"https://www.versuchundirrtum.com/acceptapplication/@id={#{job_id},#{user_id}}" target=3D"_blank" style=3D=
"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: cen=
ter;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-=
text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;">Acce=
pt</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table></td>
                                                    </tr>
                                                </table>
                                                <!--[if (gte mso 9)|(IE)]>
                                                </td>
                                                <td align=3D"center" valign=
=3D"top" width=3D"200" style=3D"width:200px;">
                                                <![endif]-->
                                                <table align=3D"left" borde=
r=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"200" class=3D"columnWr=
apper" style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-r=
space: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                    <tr>
                                                        <td valign=3D"top" =
class=3D"columnContainer" style=3D"background:transparent none no-repeat ce=
nter/cover;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit=
-text-size-adjust: 100%;background-color: transparent;background-image: non=
e;background-repeat: no-repeat;background-position: center;background-size:=
 cover;border-top: 0;border-bottom: 0;padding-top: 0;padding-bottom: 0;"><t=
able class=3D"mcnButtonBlock" style=3D"min-width: 100%;border-collapse: col=
lapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100=
%;-webkit-text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"0" cellpad=
ding=3D"0" border=3D"0">
    <tbody class=3D"mcnButtonBlockOuter">
        <tr>
            <td style=3D"padding-top: 0;padding-right: 18px;padding-bottom:=
 18px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust=
: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnButtonBlockInner" valig=
n=3D"top" align=3D"center">
                <table class=3D"mcnButtonContentContainer" style=3D"border-=
collapse: separate !important;border-radius: 4px;background-color: #0065BD;=
mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-web=
kit-text-size-adjust: 100%;" cellspacing=3D"0" cellpadding=3D"0" border=3D"=
0">
                    <tbody>
                        <tr>
                            <td class=3D"mcnButtonContent" style=3D"font-fa=
mily: Arial;font-size: 16px;padding: 18px;mso-line-height-rule: exactly;-ms=
-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" valign=3D"middle" =
align=3D"center">
                                <a class=3D"mcnButton " title=3D"View detai=
ls" href=3D"https://www.versuchundirrtum.com/viewapplication/@id={#{job_id},#{user_id}}" target=3D"_blank" style=
=3D"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: =
center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-=
ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;">V=
iew details</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table></td>
                                                    </tr>
                                                </table>
                                                <!--[if (gte mso 9)|(IE)]>
                                                </td>
                                                <td align=3D"center" valign=
=3D"top" width=3D"200" style=3D"width:200px;">
                                                <![endif]-->
                                                <table align=3D"left" borde=
r=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"200" class=3D"columnWr=
apper" style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-r=
space: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                    <tr>
                                                        <td valign=3D"top" =
class=3D"columnContainer" style=3D"background:transparent none no-repeat ce=
nter/cover;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit=
-text-size-adjust: 100%;background-color: transparent;background-image: non=
e;background-repeat: no-repeat;background-position: center;background-size:=
 cover;border-top: 0;border-bottom: 0;padding-top: 0;padding-bottom: 0;"><t=
able class=3D"mcnButtonBlock" style=3D"min-width: 100%;border-collapse: col=
lapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100=
%;-webkit-text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"0" cellpad=
ding=3D"0" border=3D"0">
    <tbody class=3D"mcnButtonBlockOuter">
        <tr>
            <td style=3D"padding-top: 0;padding-right: 18px;padding-bottom:=
 18px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust=
: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnButtonBlockInner" valig=
n=3D"top" align=3D"center">
                <table class=3D"mcnButtonContentContainer" style=3D"border-=
collapse: separate !important;border-radius: 4px;background-color: #4CAAD8;=
mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-web=
kit-text-size-adjust: 100%;" cellspacing=3D"0" cellpadding=3D"0" border=3D"=
0">
                    <tbody>
                        <tr>
                            <td class=3D"mcnButtonContent" style=3D"font-fa=
mily: Arial;font-size: 16px;padding: 18px;mso-line-height-rule: exactly;-ms=
-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" valign=3D"middle" =
align=3D"center">
                                <a class=3D"mcnButton " title=3D"Reject" hr=
ef=3D"https://www.versuchundirrtum.com/rejectapplication/@id={#{job_id},#{user_id}}" target=3D"_blank" style=3D=
"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: cen=
ter;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-=
text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;">Reje=
ct</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table></td>
                                                    </tr>
                                                </table>
                                                <!--[if (gte mso 9)|(IE)]>
                                                </td>
                                                </tr>
                                                </table>
                                                <![endif]-->
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align=3D"center" valign=3D"top" id=3D"t=
emplateLowerColumns" data-template-container=3D"" style=3D"background:#CDDC=
#{ # BILD UNTEN#
    }
E4 url(&quot;https://picjumbo.com/wp-content/uploads/random-san-francisco-street-blurred-background-2210x1473.jpg&quot;) no-repeat center/cover;mso-lin=
e-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust:=
 100%;background-color: #CDDCE4;background-image: url(https://mcusercontent=
.com/8d764482dffdf18e057bac1bc/images/fbcffd08-4ad7-cde6-2f8d-cfdf5c415fc3.=
jpg);background-repeat: no-repeat;background-position: center;background-si=
ze: cover;border-top: 0;border-bottom: 0;padding-top: 0px;padding-bottom: 0=
px;">
                                    <table border=3D"0" cellpadding=3D"0" c=
ellspacing=3D"0" width=3D"100%" class=3D"templateContainer" style=3D"border=
-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-si=
ze-adjust: 100%;-webkit-text-size-adjust: 100%;max-width: 600px !important;=
">
                                        <tr>
                                            <td valign=3D"top" class=3D"low=
erColumnHeaderContainer" style=3D"mso-line-height-rule: exactly;-ms-text-si=
ze-adjust: 100%;-webkit-text-size-adjust: 100%;"><table class=3D"mcnDivider=
Block" style=3D"min-width: 100%;border-collapse: collapse;mso-table-lspace:=
 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adj=
ust: 100%;table-layout: fixed !important;" width=3D"100%" cellspacing=3D"0"=
 cellpadding=3D"0" border=3D"0">
    <tbody class=3D"mcnDividerBlockOuter">
        <tr>
            <td class=3D"mcnDividerBlockInner" style=3D"min-width: 100%;pad=
ding: 54px 18px 45px;mso-line-height-rule: exactly;-ms-text-size-adjust: 10=
0%;-webkit-text-size-adjust: 100%;">
                <table class=3D"mcnDividerContent" style=3D"min-width: 100%=
;border-top: 2px solid #DE5B49;border-collapse: collapse;mso-table-lspace: =
0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adju=
st: 100%;" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0">
                    <tbody><tr>
                        <td style=3D"mso-line-height-rule: exactly;-ms-text=
-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                            <span></span>
                        </td>
                    </tr>
                </tbody></table>
<!--           =20
                <td class=3D"mcnDividerBlockInner" style=3D"padding: 18px;"=
>
                <hr class=3D"mcnDividerContent" style=3D"border-bottom-colo=
r:none; border-left-color:none; border-right-color:none; border-bottom-widt=
h:0; border-left-width:0; border-right-width:0; margin-top:0; margin-right:=
0; margin-bottom:0; margin-left:0;" />
-->
            </td>
        </tr>
    </tbody>
</table><table class=3D"mcnTextBlock" style=3D"min-width: 100%;border-colla=
pse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adj=
ust: 100%;-webkit-text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"0"=
 cellpadding=3D"0" border=3D"0">
    <tbody class=3D"mcnTextBlockOuter">
        <tr>
            <td class=3D"mcnTextBlockInner" style=3D"padding-top: 9px;mso-l=
ine-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjus=
t: 100%;" valign=3D"top">
              =09<!--[if mso]>
=09=09=09=09<table align=3D"left" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0" width=3D"100%" style=3D"width:100%;">
=09=09=09=09<tr>
=09=09=09=09<![endif]-->
=09=09=09   =20
=09=09=09=09<!--[if mso]>
=09=09=09=09<td valign=3D"top" width=3D"600" style=3D"width:600px;">
=09=09=09=09<![endif]-->
                <table style=3D"max-width: 100%;min-width: 100%;border-coll=
apse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-ad=
just: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnTextContentContaine=
r" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D=
"left">
                    <tbody><tr>
                       =20
                        <td class=3D"mcnTextContent" style=3D"padding-top: =
0;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;mso-line-heigh=
t-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;w=
ord-break: break-word;color: #202020;font-family: 'Noticia Text', Georgia, =
'Times New Roman', serif;font-size: 18px;line-height: 150%;text-align: left=
;" valign=3D"top">
                       =20
                            <h2 style=3D"display: block;margin: 0;padding: =
0;color: #1F2F38;font-family: 'Noticia Text', Georgia, 'Times New Roman', s=
erif;font-size: 48px;font-style: normal;font-weight: bold;line-height: 150%=
;letter-spacing: normal;text-align: center;">Users also liked:</h2>

                        </td>
                    </tr>
                </tbody></table>
=09=09=09=09<!--[if mso]>
=09=09=09=09</td>
=09=09=09=09<![endif]-->
               =20
=09=09=09=09<!--[if mso]>
=09=09=09=09</tr>
=09=09=09=09</table>
=09=09=09=09<![endif]-->
            </td>
        </tr>
    </tbody>
</table><table class=3D"mcnDividerBlock" style=3D"min-width: 100%;border-co=
llapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-=
adjust: 100%;-webkit-text-size-adjust: 100%;table-layout: fixed !important;=
" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0">
    <tbody class=3D"mcnDividerBlockOuter">
        <tr>
            <td class=3D"mcnDividerBlockInner" style=3D"min-width: 100%;pad=
ding: 54px 18px 45px;mso-line-height-rule: exactly;-ms-text-size-adjust: 10=
0%;-webkit-text-size-adjust: 100%;">
                <table class=3D"mcnDividerContent" style=3D"min-width: 100%=
;border-top: 2px solid #DE5B49;border-collapse: collapse;mso-table-lspace: =
0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adju=
st: 100%;" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0">
                    <tbody><tr>
                        <td style=3D"mso-line-height-rule: exactly;-ms-text=
-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                            <span></span>
                        </td>
                    </tr>
                </tbody></table>
<!--           =20
                <td class=3D"mcnDividerBlockInner" style=3D"padding: 18px;"=
>
                <hr class=3D"mcnDividerContent" style=3D"border-bottom-colo=
r:none; border-left-color:none; border-right-color:none; border-bottom-widt=
h:0; border-left-width:0; border-right-width:0; margin-top:0; margin-right:=
0; margin-bottom:0; margin-left:0;" />
-->
            </td>
        </tr>
    </tbody>
</table></td>
                                        </tr>
                                        <tr>
                                            <td valign=3D"top" style=3D"mso=
-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adj=
ust: 100%;">
                                                <!--[if (gte mso 9)|(IE)]>
                                                <table align=3D"center" bor=
der=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"600" style=3D"width:=
600px;">
                                                <tr>
                                                <td align=3D"center" valign=
=3D"top" width=3D"300" style=3D"width:300px;">
                                                <![endif]-->
                                                <table align=3D"left" borde=
r=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"300" class=3D"columnWr=
apper" style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-r=
space: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                    <tr>
                                                        <td valign=3D"top" =
class=3D"columnContainer" style=3D"background:transparent none no-repeat ce=
nter/cover;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit=
-text-size-adjust: 100%;background-color: transparent;background-image: non=
e;background-repeat: no-repeat;background-position: center;background-size:=
 cover;border-top: 0;border-bottom: 0;padding-top: 0;padding-bottom: 0;"><t=
able class=3D"mcnTextBlock" style=3D"min-width: 100%;border-collapse: colla=
pse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;=
-webkit-text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"0" cellpaddi=
ng=3D"0" border=3D"0">
    <tbody class=3D"mcnTextBlockOuter">
        <tr>
            <td class=3D"mcnTextBlockInner" style=3D"padding-top: 9px;mso-l=
ine-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjus=
t: 100%;" valign=3D"top">
              =09<!--[if mso]>
=09=09=09=09<table align=3D"left" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0" width=3D"100%" style=3D"width:100%;">
=09=09=09=09<tr>
=09=09=09=09<![endif]-->
=09=09=09   =20
=09=09=09=09<!--[if mso]>
=09=09=09=09<td valign=3D"top" width=3D"300" style=3D"width:300px;">
=09=09=09=09<![endif]-->
                <table style=3D"max-width: 100%;min-width: 100%;border-coll=
apse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-ad=
just: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnTextContentContaine=
r" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D=
"left">
                    <tbody><tr>
                       =20
                        <td class=3D"mcnTextContent" style=3D"padding-top: =
0;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;mso-line-heigh=
t-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;w=
ord-break: break-word;color: #202020;font-family: 'Noticia Text', Georgia, =
'Times New Roman', serif;font-size: 18px;line-height: 150%;text-align: left=
;" valign=3D"top">
                       =20
                            <h3 style=3D"display: block;margin: 0;padding: =
0;color: #1F2F38;font-family: 'Noticia Text', Georgia, 'Times New Roman', s=
erif;font-size: 36px;font-style: normal;font-weight: bold;line-height: 150%=
;letter-spacing: normal;text-align: center;"><span style=3D"color:#ffffff">=
Hier k=C3=B6nnte Ihre Werbung stehen</span></h3>

                        </td>
                    </tr>
                </tbody></table>
=09=09=09=09<!--[if mso]>
=09=09=09=09</td>
=09=09=09=09<![endif]-->
               =20
=09=09=09=09<!--[if mso]>
=09=09=09=09</tr>
=09=09=09=09</table>
=09=09=09=09<![endif]-->
            </td>
        </tr>
    </tbody>
</table><table class=3D"mcnDividerBlock" style=3D"min-width: 100%;border-co=
llapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-=
adjust: 100%;-webkit-text-size-adjust: 100%;table-layout: fixed !important;=
" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0">
    <tbody class=3D"mcnDividerBlockOuter">
        <tr>
            <td class=3D"mcnDividerBlockInner" style=3D"min-width: 100%;pad=
ding: 63px 18px 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 10=
0%;-webkit-text-size-adjust: 100%;">
                <table class=3D"mcnDividerContent" style=3D"min-width: 100%=
;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-=
text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width=3D"100%" cell=
spacing=3D"0" cellpadding=3D"0" border=3D"0">
                    <tbody><tr>
                        <td style=3D"mso-line-height-rule: exactly;-ms-text=
-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                            <span></span>
                        </td>
                    </tr>
                </tbody></table>
<!--           =20
                <td class=3D"mcnDividerBlockInner" style=3D"padding: 18px;"=
>
                <hr class=3D"mcnDividerContent" style=3D"border-bottom-colo=
r:none; border-left-color:none; border-right-color:none; border-bottom-widt=
h:0; border-left-width:0; border-right-width:0; margin-top:0; margin-right:=
0; margin-bottom:0; margin-left:0;" />
-->
            </td>
        </tr>
    </tbody>
</table><table class=3D"mcnButtonBlock" style=3D"min-width: 100%;border-col=
lapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-a=
djust: 100%;-webkit-text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"=
0" cellpadding=3D"0" border=3D"0">
    <tbody class=3D"mcnButtonBlockOuter">
        <tr>
            <td style=3D"padding-top: 0;padding-right: 18px;padding-bottom:=
 18px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust=
: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnButtonBlockInner" valig=
n=3D"top" align=3D"center">
                <table class=3D"mcnButtonContentContainer" style=3D"border-=
collapse: separate !important;border-radius: 3px;background-color: #E37222;=
mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-web=
kit-text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"0" cellpadding=
=3D"0" border=3D"0">
                    <tbody>
                        <tr>
                            <td class=3D"mcnButtonContent" style=3D"font-fa=
mily: &quot;Noticia Text&quot;, Georgia, &quot;Times New Roman&quot;, serif=
;font-size: 20px;padding: 9px;mso-line-height-rule: exactly;-ms-text-size-a=
djust: 100%;-webkit-text-size-adjust: 100%;" valign=3D"middle" align=3D"cen=
ter">
                                <a class=3D"mcnButton " title=3D"go to jobf=
inder" href=3D"https://www.versuchundirrtum.com" target=3D"_self" style=3D"font-=
weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;te=
xt-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-s=
ize-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;">go to jobf=
inder</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table><table class=3D"mcnDividerBlock" style=3D"min-width: 100%;border-co=
llapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-=
adjust: 100%;-webkit-text-size-adjust: 100%;table-layout: fixed !important;=
" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0">
    <tbody class=3D"mcnDividerBlockOuter">
        <tr>
            <td class=3D"mcnDividerBlockInner" style=3D"min-width: 100%;pad=
ding: 36px 18px 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 10=
0%;-webkit-text-size-adjust: 100%;">
                <table class=3D"mcnDividerContent" style=3D"min-width: 100%=
;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-=
text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width=3D"100%" cell=
spacing=3D"0" cellpadding=3D"0" border=3D"0">
                    <tbody><tr>
                        <td style=3D"mso-line-height-rule: exactly;-ms-text=
-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                            <span></span>
                        </td>
                    </tr>
                </tbody></table>
<!--           =20
                <td class=3D"mcnDividerBlockInner" style=3D"padding: 18px;"=
>
                <hr class=3D"mcnDividerContent" style=3D"border-bottom-colo=
r:none; border-left-color:none; border-right-color:none; border-bottom-widt=
h:0; border-left-width:0; border-right-width:0; margin-top:0; margin-right:=
0; margin-bottom:0; margin-left:0;" />
-->
            </td>
        </tr>
    </tbody>
</table></td>
                                                    </tr>
                                                </table>
                                                <!--[if (gte mso 9)|(IE)]>
                                                </td>
                                                <td align=3D"center" valign=
=3D"top" width=3D"300" style=3D"width:300px;">
                                                <![endif]-->
                                                <table align=3D"left" borde=
r=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"300" class=3D"columnWr=
apper" style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-r=
space: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                    <tr>
                                                        <td valign=3D"top" =
class=3D"columnContainer" style=3D"background:transparent none no-repeat ce=
nter/cover;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit=
-text-size-adjust: 100%;background-color: transparent;background-image: non=
e;background-repeat: no-repeat;background-position: center;background-size:=
 cover;border-top: 0;border-bottom: 0;padding-top: 0;padding-bottom: 0;"><t=
able class=3D"mcnTextBlock" style=3D"min-width: 100%;border-collapse: colla=
pse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;=
-webkit-text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"0" cellpaddi=
ng=3D"0" border=3D"0">
    <tbody class=3D"mcnTextBlockOuter">
        <tr>
            <td class=3D"mcnTextBlockInner" style=3D"padding-top: 9px;mso-l=
ine-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjus=
t: 100%;" valign=3D"top">
              =09<!--[if mso]>
=09=09=09=09<table align=3D"left" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0" width=3D"100%" style=3D"width:100%;">
=09=09=09=09<tr>
=09=09=09=09<![endif]-->
=09=09=09   =20
=09=09=09=09<!--[if mso]>
=09=09=09=09<td valign=3D"top" width=3D"300" style=3D"width:300px;">
=09=09=09=09<![endif]-->
                <table style=3D"max-width: 100%;min-width: 100%;border-coll=
apse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-ad=
just: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnTextContentContaine=
r" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D=
"left">
                    <tbody><tr>
                       =20
                        <td class=3D"mcnTextContent" style=3D"padding-top: =
0;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;mso-line-heigh=
t-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;w=
ord-break: break-word;color: #202020;font-family: 'Noticia Text', Georgia, =
'Times New Roman', serif;font-size: 18px;line-height: 150%;text-align: left=
;" valign=3D"top">
                       =20
                            <h3 style=3D"display: block;margin: 0;padding: =
0;color: #1F2F38;font-family: 'Noticia Text', Georgia, 'Times New Roman', s=
erif;font-size: 36px;font-style: normal;font-weight: bold;line-height: 150%=
;letter-spacing: normal;text-align: center;"><span style=3D"color:#FFFFFF">=
Hier k=C3=B6nnte Ihre Werbung stehen</span></h3>

                        </td>
                    </tr>
                </tbody></table>
=09=09=09=09<!--[if mso]>
=09=09=09=09</td>
=09=09=09=09<![endif]-->
               =20
=09=09=09=09<!--[if mso]>
=09=09=09=09</tr>
=09=09=09=09</table>
=09=09=09=09<![endif]-->
            </td>
        </tr>
    </tbody>
</table><table class=3D"mcnDividerBlock" style=3D"min-width: 100%;border-co=
llapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-=
adjust: 100%;-webkit-text-size-adjust: 100%;table-layout: fixed !important;=
" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0">
    <tbody class=3D"mcnDividerBlockOuter">
        <tr>
            <td class=3D"mcnDividerBlockInner" style=3D"min-width: 100%;pad=
ding: 63px 18px 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 10=
0%;-webkit-text-size-adjust: 100%;">
                <table class=3D"mcnDividerContent" style=3D"min-width: 100%=
;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-=
text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width=3D"100%" cell=
spacing=3D"0" cellpadding=3D"0" border=3D"0">
                    <tbody><tr>
                        <td style=3D"mso-line-height-rule: exactly;-ms-text=
-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                            <span></span>
                        </td>
                    </tr>
                </tbody></table>
<!--           =20
                <td class=3D"mcnDividerBlockInner" style=3D"padding: 18px;"=
>
                <hr class=3D"mcnDividerContent" style=3D"border-bottom-colo=
r:none; border-left-color:none; border-right-color:none; border-bottom-widt=
h:0; border-left-width:0; border-right-width:0; margin-top:0; margin-right:=
0; margin-bottom:0; margin-left:0;" />
-->
            </td>
        </tr>
    </tbody>
</table><table class=3D"mcnButtonBlock" style=3D"min-width: 100%;border-col=
lapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-a=
djust: 100%;-webkit-text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"=
0" cellpadding=3D"0" border=3D"0">
    <tbody class=3D"mcnButtonBlockOuter">
        <tr>
            <td style=3D"padding-top: 0;padding-right: 18px;padding-bottom:=
 18px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust=
: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnButtonBlockInner" valig=
n=3D"top" align=3D"center">
                <table class=3D"mcnButtonContentContainer" style=3D"border-=
collapse: separate !important;border-radius: 3px;background-color: #E37222;=
mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-web=
kit-text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"0" cellpadding=
=3D"0" border=3D"0">
                    <tbody>
                        <tr>
                            <td class=3D"mcnButtonContent" style=3D"font-fa=
mily: &quot;Noticia Text&quot;, Georgia, &quot;Times New Roman&quot;, serif=
;font-size: 20px;padding: 9px;mso-line-height-rule: exactly;-ms-text-size-a=
djust: 100%;-webkit-text-size-adjust: 100%;" valign=3D"middle" align=3D"cen=
ter">
                                <a class=3D"mcnButton " title=3D"make a don=
ation" href=3D"https://paypal.me/carlobortolan" target=3D"_self" style=3D"font-weight: bol=
d;letter-spacing: normal;line-height: 100%;text-align: center;text-decorati=
on: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust:=
 100%;-webkit-text-size-adjust: 100%;display: block;">make a donation</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table><table class=3D"mcnDividerBlock" style=3D"min-width: 100%;border-co=
llapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-=
adjust: 100%;-webkit-text-size-adjust: 100%;table-layout: fixed !important;=
" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0">
    <tbody class=3D"mcnDividerBlockOuter">
        <tr>
            <td class=3D"mcnDividerBlockInner" style=3D"min-width: 100%;pad=
ding: 36px 18px 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 10=
0%;-webkit-text-size-adjust: 100%;">
                <table class=3D"mcnDividerContent" style=3D"min-width: 100%=
;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-=
text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width=3D"100%" cell=
spacing=3D"0" cellpadding=3D"0" border=3D"0">
                    <tbody><tr>
                        <td style=3D"mso-line-height-rule: exactly;-ms-text=
-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                            <span></span>
                        </td>
                    </tr>
                </tbody></table>
<!--           =20
                <td class=3D"mcnDividerBlockInner" style=3D"padding: 18px;"=
>
                <hr class=3D"mcnDividerContent" style=3D"border-bottom-colo=
r:none; border-left-color:none; border-right-color:none; border-bottom-widt=
h:0; border-left-width:0; border-right-width:0; margin-top:0; margin-right:=
0; margin-bottom:0; margin-left:0;" />
-->
            </td>
        </tr>
    </tbody>
</table></td>
                                                    </tr>
                                                </table>
                                                <!--[if (gte mso 9)|(IE)]>
                                                </td>
                                                </tr>
                                                </table>
                                                <![endif]-->
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align=3D"center" valign=3D"top" id=3D"t=
emplateFooter" data-template-container=3D"" style=3D"background:#005293 non=
e no-repeat center/cover;mso-line-height-rule: exactly;-ms-text-size-adjust=
: 100%;-webkit-text-size-adjust: 100%;background-color: #005293;background-=
image: none;background-repeat: no-repeat;background-position: center;backgr=
ound-size: cover;border-top: 0;border-bottom: 0;padding-top: 46px;padding-b=
ottom: 46px;">
                                    <!--[if (gte mso 9)|(IE)]>
                                    <table align=3D"center" border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0" width=3D"600" style=3D"width:600px;">
                                    <tr>
                                    <td align=3D"center" valign=3D"top" wid=
th=3D"600" style=3D"width:600px;">
                                    <![endif]-->
                                    <table align=3D"center" border=3D"0" ce=
llpadding=3D"0" cellspacing=3D"0" width=3D"100%" class=3D"templateContainer=
" style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace=
: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;max-width: =
600px !important;">
                                        <tr>
                                            <td valign=3D"top" class=3D"foo=
terContainer" style=3D"background:transparent none no-repeat center/cover;m=
so-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-a=
djust: 100%;background-color: transparent;background-image: none;background=
-repeat: no-repeat;background-position: center;background-size: cover;borde=
r-top: 0;border-bottom: 0;padding-top: 0;padding-bottom: 0;"><table class=
=3D"mcnFollowBlock" style=3D"min-width: 100%;border-collapse: collapse;mso-=
table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-=
text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0"=
 border=3D"0">
    <tbody class=3D"mcnFollowBlockOuter">
        <tr>
            <td style=3D"padding: 9px;mso-line-height-rule: exactly;-ms-tex=
t-size-adjust: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnFollowBloc=
kInner" valign=3D"top" align=3D"center">
                <table class=3D"mcnFollowContentContainer" style=3D"min-wid=
th: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: =
0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width=3D"10=
0%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0">
    <tbody><tr>
        <td style=3D"padding-left: 9px;padding-right: 9px;mso-line-height-r=
ule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" al=
ign=3D"center">
            <table style=3D"min-width: 100%;border-collapse: collapse;mso-t=
able-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-t=
ext-size-adjust: 100%;" class=3D"mcnFollowContent" width=3D"100%" cellspaci=
ng=3D"0" cellpadding=3D"0" border=3D"0">
                <tbody><tr>
                    <td style=3D"padding-top: 9px;padding-right: 9px;paddin=
g-left: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webki=
t-text-size-adjust: 100%;" valign=3D"top" align=3D"center">
                        <table cellspacing=3D"0" cellpadding=3D"0" border=
=3D"0" align=3D"center" style=3D"border-collapse: collapse;mso-table-lspace=
: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-ad=
just: 100%;">
                            <tbody><tr>
                                <td valign=3D"top" align=3D"center" style=
=3D"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-s=
ize-adjust: 100%;">
                                    <!--[if mso]>
                                    <table align=3D"center" border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0">
                                    <tr>
                                    <![endif]-->
                                   =20
                                        <!--[if mso]>
                                        <td align=3D"center" valign=3D"top"=
>
                                        <![endif]-->
                                       =20
                                       =20
                                            <table style=3D"display: inline=
;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-=
text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" cellspacing=3D"0" c=
ellpadding=3D"0" border=3D"0" align=3D"left">
                                                <tbody><tr>
                                                    <td style=3D"padding-ri=
ght: 10px;padding-bottom: 9px;mso-line-height-rule: exactly;-ms-text-size-a=
djust: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnFollowContentItemC=
ontainer" valign=3D"top">
                                                        <table class=3D"mcn=
FollowContentItem" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" borde=
r=3D"0" style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-=
rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                            <tbody><tr>
                                                                <td style=
=3D"padding-top: 5px;padding-right: 10px;padding-bottom: 5px;padding-left: =
9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-s=
ize-adjust: 100%;" valign=3D"middle" align=3D"left">
                                                                    <table =
width=3D"" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D"left" =
style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: =
0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                                        <tb=
ody><tr>
                                                                           =
=20
                                                                           =
     <td class=3D"mcnFollowIconContent" width=3D"24" valign=3D"middle" alig=
n=3D"center" style=3D"mso-line-height-rule: exactly;-ms-text-size-adjust: 1=
00%;-webkit-text-size-adjust: 100%;">
                                                                           =
         <a href=3D"https://www.linkedin.com" target=3D"_blank" style=3D"mso-line-height=
-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">=
#{ # LINKEDIN
    }
<img src=3D"https://www.freepnglogos.com/uploads/linkedin-basic-round-social-logo-png-13.png" alt=3D"LinkedIn" style=3D"display: block;border: 0;height: a=
uto;outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;" c=
lass=3D"" width=3D"24" height=3D"24"></a>
                                                                           =
     </td>
                                                                           =
=20
                                                                           =
=20
                                                                        </t=
r>
                                                                    </tbody=
></table>
                                                                </td>
                                                            </tr>
                                                        </tbody></table>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                       =20
                                        <!--[if mso]>
                                        </td>
                                        <![endif]-->
                                   =20
                                        <!--[if mso]>
                                        <td align=3D"center" valign=3D"top"=
>
                                        <![endif]-->
                                       =20
                                       =20
                                            <table style=3D"display: inline=
;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-=
text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" cellspacing=3D"0" c=
ellpadding=3D"0" border=3D"0" align=3D"left">
                                                <tbody><tr>
                                                    <td style=3D"padding-ri=
ght: 10px;padding-bottom: 9px;mso-line-height-rule: exactly;-ms-text-size-a=
djust: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnFollowContentItemC=
ontainer" valign=3D"top">
                                                        <table class=3D"mcn=
FollowContentItem" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" borde=
r=3D"0" style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-=
rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                            <tbody><tr>
                                                                <td style=
=3D"padding-top: 5px;padding-right: 10px;padding-bottom: 5px;padding-left: =
9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-s=
ize-adjust: 100%;" valign=3D"middle" align=3D"left">
                                                                    <table =
width=3D"" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D"left" =
style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: =
0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                                        <tb=
ody><tr>
                                                                           =
=20
                                                                           =
     <td class=3D"mcnFollowIconContent" width=3D"24" valign=3D"middle" alig=
n=3D"center" style=3D"mso-line-height-rule: exactly;-ms-text-size-adjust: 1=
00%;-webkit-text-size-adjust: 100%;">
                                                                           =
         <a href=3D"https://instagram.com/carlo.brt" target=3D"_blank" style=3D"mso-line-h=
eight-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 10=
0%;"><img src=3D"https://cdn-images.mailchimp.com/icons/social-block-v2/col=
or-instagram-48.png" alt=3D"Instagram" style=3D"display: block;border: 0;he=
ight: auto;outline: none;text-decoration: none;-ms-interpolation-mode: bicu=
bic;" class=3D"" width=3D"24" height=3D"24"></a>
                                                                           =
     </td>
                                                                           =
=20
                                                                           =
=20
                                                                        </t=
r>
                                                                    </tbody=
></table>
                                                                </td>
                                                            </tr>
                                                        </tbody></table>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                       =20
                                        <!--[if mso]>
                                        </td>
                                        <![endif]-->
                                   =20
                                        <!--[if mso]>
                                        <td align=3D"center" valign=3D"top"=
>
                                        <![endif]-->
                                       =20
                                       =20
                                            <table style=3D"display: inline=
;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-=
text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" cellspacing=3D"0" c=
ellpadding=3D"0" border=3D"0" align=3D"left">
                                                <tbody><tr>
                                                    <td style=3D"padding-ri=
ght: 10px;padding-bottom: 9px;mso-line-height-rule: exactly;-ms-text-size-a=
djust: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnFollowContentItemC=
ontainer" valign=3D"top">
                                                        <table class=3D"mcn=
FollowContentItem" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" borde=
r=3D"0" style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-=
rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                            <tbody><tr>
                                                                <td style=
=3D"padding-top: 5px;padding-right: 10px;padding-bottom: 5px;padding-left: =
9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-s=
ize-adjust: 100%;" valign=3D"middle" align=3D"left">
                                                                    <table =
width=3D"" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D"left" =
style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: =
0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                                        <tb=
ody><tr>
                                                                           =
=20
                                                                           =
     <td class=3D"mcnFollowIconContent" width=3D"24" valign=3D"middle" alig=
n=3D"center" style=3D"mso-line-height-rule: exactly;-ms-text-size-adjust: 1=
00%;-webkit-text-size-adjust: 100%;">
                                                                           =
         <a href=3D"https://github.com/carlobortolan" target=3D"_blank" style=3D"mso-line=
-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: =
100%;"><img src=3D"https://cdn-images.mailchimp.com/icons/social-block-v2/c=
olor-github-48.png" alt=3D"GitHub" style=3D"display: block;border: 0;height=
: auto;outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;=
" class=3D"" width=3D"24" height=3D"24"></a>
                                                                           =
     </td>
                                                                           =
=20
                                                                           =
=20
                                                                        </t=
r>
                                                                    </tbody=
></table>
                                                                </td>
                                                            </tr>
                                                        </tbody></table>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                       =20
                                        <!--[if mso]>
                                        </td>
                                        <![endif]-->
                                   =20
                                        <!--[if mso]>
                                        <td align=3D"center" valign=3D"top"=
>
                                        <![endif]-->
                                       =20
                                       =20
                                            <table style=3D"display: inline=
;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-=
text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" cellspacing=3D"0" c=
ellpadding=3D"0" border=3D"0" align=3D"left">
                                                <tbody><tr>
                                                    <td style=3D"padding-ri=
ght: 10px;padding-bottom: 9px;mso-line-height-rule: exactly;-ms-text-size-a=
djust: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnFollowContentItemC=
ontainer" valign=3D"top">
                                                        <table class=3D"mcn=
FollowContentItem" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" borde=
r=3D"0" style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-=
rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                            <tbody><tr>
                                                                <td style=
=3D"padding-top: 5px;padding-right: 10px;padding-bottom: 5px;padding-left: =
9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-s=
ize-adjust: 100%;" valign=3D"middle" align=3D"left">
                                                                    <table =
width=3D"" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D"left" =
style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: =
0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                                        <tb=
ody><tr>
                                                                           =
=20
                                                                           =
     <td class=3D"mcnFollowIconContent" width=3D"24" valign=3D"middle" alig=
n=3D"center" style=3D"mso-line-height-rule: exactly;-ms-text-size-adjust: 1=
00%;-webkit-text-size-adjust: 100%;">
                                                                           =
         <a href=3D"mailto:carlo.bortolan@tum.de" target=3D"_blank" style=
=3D"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-s=
ize-adjust: 100%;"><img src=3D"https://cdn-images.mailchimp.com/icons/socia=
l-block-v2/color-forwardtofriend-48.png" alt=3D"Email" style=3D"display: bl=
ock;border: 0;height: auto;outline: none;text-decoration: none;-ms-interpol=
ation-mode: bicubic;" class=3D"" width=3D"24" height=3D"24"></a>
                                                                           =
     </td>
                                                                           =
=20
                                                                           =
=20
                                                                        </t=
r>
                                                                    </tbody=
></table>
                                                                </td>
                                                            </tr>
                                                        </tbody></table>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                       =20
                                        <!--[if mso]>
                                        </td>
                                        <![endif]-->
                                   =20
                                        <!--[if mso]>
                                        <td align=3D"center" valign=3D"top"=
>
                                        <![endif]-->
                                       =20
                                       =20
                                            <table style=3D"display: inline=
;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-=
text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" cellspacing=3D"0" c=
ellpadding=3D"0" border=3D"0" align=3D"left">
                                                <tbody><tr>
                                                    <td style=3D"padding-ri=
ght: 0;padding-bottom: 9px;mso-line-height-rule: exactly;-ms-text-size-adju=
st: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnFollowContentItemCont=
ainer" valign=3D"top">
                                                        <table class=3D"mcn=
FollowContentItem" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" borde=
r=3D"0" style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-=
rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                            <tbody><tr>
                                                                <td style=
=3D"padding-top: 5px;padding-right: 10px;padding-bottom: 5px;padding-left: =
9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-s=
ize-adjust: 100%;" valign=3D"middle" align=3D"left">
                                                                    <table =
width=3D"" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D"left" =
style=3D"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: =
0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                                        <tb=
ody><tr>
                                                                           =
=20
                                                                           =
     <td class=3D"mcnFollowIconContent" width=3D"24" valign=3D"middle" alig=
n=3D"center" style=3D"mso-line-height-rule: exactly;-ms-text-size-adjust: 1=
00%;-webkit-text-size-adjust: 100%;">
                                                                           =
         <a href=3D"https://www.versuchundirrtum.de" target=3D"_blank" style=3D"mso-line-hei=
ght-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%=
;"><img src=3D"https://cdn-images.mailchimp.com/icons/social-block-v2/color=
-link-48.png" alt=3D"Website" style=3D"display: block;border: 0;height: aut=
o;outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;" cla=
ss=3D"" width=3D"24" height=3D"24"></a>
                                                                           =
     </td>
                                                                           =
=20
                                                                           =
=20
                                                                        </t=
r>
                                                                    </tbody=
></table>
                                                                </td>
                                                            </tr>
                                                        </tbody></table>
                                                    </td>
                                                </tr>
                                            </tbody></table>
                                       =20
                                        <!--[if mso]>
                                        </td>
                                        <![endif]-->
                                   =20
                                    <!--[if mso]>
                                    </tr>
                                    </table>
                                    <![endif]-->
                                </td>
                            </tr>
                        </tbody></table>
                    </td>
                </tr>
            </tbody></table>
        </td>
    </tr>
</tbody></table>

            </td>
        </tr>
    </tbody>
</table><table class=3D"mcnTextBlock" style=3D"min-width: 100%;border-colla=
pse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adj=
ust: 100%;-webkit-text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"0"=
 cellpadding=3D"0" border=3D"0">
    <tbody class=3D"mcnTextBlockOuter">
        <tr>
            <td class=3D"mcnTextBlockInner" style=3D"padding-top: 9px;mso-l=
ine-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjus=
t: 100%;" valign=3D"top">
              =09<!--[if mso]>
=09=09=09=09<table align=3D"left" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0" width=3D"100%" style=3D"width:100%;">
=09=09=09=09<tr>
=09=09=09=09<![endif]-->
=09=09=09   =20
=09=09=09=09<!--[if mso]>
=09=09=09=09<td valign=3D"top" width=3D"600" style=3D"width:600px;">
=09=09=09=09<![endif]-->
                <table style=3D"max-width: 100%;min-width: 100%;border-coll=
apse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-ad=
just: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnTextContentContaine=
r" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D=
"left">
                    <tbody><tr>
                       =20
                        <td class=3D"mcnTextContent" style=3D"padding-top: =
0;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;mso-line-heigh=
t-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;w=
ord-break: break-word;color: #FFFFFF;font-family: Helvetica;font-size: 12px=
;line-height: 150%;text-align: center;" valign=3D"top">
                       =20
                            <a href=3D"*|ARCHIVE|*" target=3D"blank" style=
=3D"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-s=
ize-adjust: 100%;color: #FFFFFF;font-weight: normal;text-decoration: underl=
ine;">view this email in your browser</a><br>
&nbsp;
                        </td>
                    </tr>
                </tbody></table>
=09=09=09=09<!--[if mso]>
=09=09=09=09</td>
=09=09=09=09<![endif]-->
               =20
=09=09=09=09<!--[if mso]>
=09=09=09=09</tr>
=09=09=09=09</table>
=09=09=09=09<![endif]-->
            </td>
        </tr>
    </tbody>
</table><table class=3D"mcnTextBlock" style=3D"min-width: 100%;border-colla=
pse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adj=
ust: 100%;-webkit-text-size-adjust: 100%;" width=3D"100%" cellspacing=3D"0"=
 cellpadding=3D"0" border=3D"0">
    <tbody class=3D"mcnTextBlockOuter">
        <tr>
            <td class=3D"mcnTextBlockInner" style=3D"padding-top: 9px;mso-l=
ine-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjus=
t: 100%;" valign=3D"top">
              =09<!--[if mso]>
=09=09=09=09<table align=3D"left" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0" width=3D"100%" style=3D"width:100%;">
=09=09=09=09<tr>
=09=09=09=09<![endif]-->
=09=09=09   =20
=09=09=09=09<!--[if mso]>
=09=09=09=09<td valign=3D"top" width=3D"600" style=3D"width:600px;">
=09=09=09=09<![endif]-->
                <table style=3D"max-width: 100%;min-width: 100%;border-coll=
apse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-ad=
just: 100%;-webkit-text-size-adjust: 100%;" class=3D"mcnTextContentContaine=
r" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" align=3D=
"left">
                    <tbody><tr>
                       =20
                        <td class=3D"mcnTextContent" style=3D"padding-top: =
0;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;mso-line-heigh=
t-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;w=
ord-break: break-word;color: #FFFFFF;font-family: Helvetica;font-size: 12px=
;line-height: 150%;text-align: center;" valign=3D"top">
                       =20
                            <em>Copyright =C2=A9 2022 Jan Hummel, Carlo Bor=
tolan, All rights reserved.</em><br>
<br>
<strong>Our mailing address is:</strong><br>
carlo.bortolan@tum.de<br>
<br>
Want to change how you receive these emails?<br>
You can <a href=3D"*|UNSUB|*" style=3D"mso-line-height-rule: exactly;-ms-te=
xt-size-adjust: 100%;-webkit-text-size-adjust: 100%;color: #FFFFFF;font-wei=
ght: normal;text-decoration: underline;">unsubscribe from this list</a>.
                        </td>
                    </tr>
                </tbody></table>
=09=09=09=09<!--[if mso]>
=09=09=09=09</td>
=09=09=09=09<![endif]-->
               =20
=09=09=09=09<!--[if mso]>
=09=09=09=09</tr>
=09=09=09=09</table>
=09=09=09=09<![endif]-->
            </td>
        </tr>
    </tbody>
</table></td>
                                        </tr>
                                    </table>
                                    <!--[if (gte mso 9)|(IE)]>
                                    </td>
                                    </tr>
                                    </table>
                                    <![endif]-->
                                </td>
                            </tr>
                        </table>
                        <!-- // END TEMPLATE -->
                    </td>
                </tr>
            </table>
        </center>
    <img src=3D"https://us9.mailchimp.com/mctx/opens?xid=3Dcb54d47d03&uid=
=3D184686458&pool=3Dtemplate_test&subject=3DMailchimp+Template+Test+-+%22t3=
%22" height=3D"1" width=3D"1" alt=3D""></body>
</html>
MESSAGE_END
    renderer = ERB.new(msg)
    smtp = Net::SMTP.new 'smtp.gmail.com', 587
    smtp.enable_starttls
    smtp.start('gmail.com', 'noreply.versuchundirrtum@gmail.com', 'gxftsfsnjuwvzaio', :login) do
      smtp.send_message(renderer.result, 'noreply.versuchundirrtum@gmail.com', "#{employer_email}")
    end
    puts "email sent successfully"
  end

  # @param [String] applicant_name Name des Bewerbers
  # @param [String] applicant_email E-Mail des Bewerbers
  # @param [int] job_id Job
  # @param [String] comment Antowort des Arbeitgebers
  # @return [void]
  def send_notification_applicant(applicant_name, applicant_email, job_id, comment)
    puts "sending email to #{applicant_email}, #{applicant_name}, #{job_id}"
    msg = <<MESSAGE_END
From: Support V&I <noreply.versuchundirrtum@gmail.com>
To: #{applicant_name} <#{applicant_email}>
MIME-Version: 1.0
Content-type: text/html
Subject: Your application for job ##{job_id} has been accepted! 
Content-Type: text/html; charset="utf-8"; format="fixed"
Content-Transfer-Encoding: quoted-printable
MESSAGE_END
    renderer = ERB.new(msg)
    smtp = Net::SMTP.new 'smtp.gmail.com', 587
    smtp.enable_starttls
    smtp.start('gmail.com', 'noreply.versuchundirrtum@gmail.com', 'gxftsfsnjuwvzaio', :login) do
      smtp.send_message(renderer.result, 'noreply.versuchundirrtum@gmail.com', "#{applicant_email}")
    end
    puts "email sent successfully"
  end

end

