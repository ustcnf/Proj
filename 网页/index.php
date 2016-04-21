<?php
/**
  * wechat php test
  */

//define your token
define("TOKEN", "weixin");
$wechatObj = new wechatCallbackapiTest();
$wechatObj->responseMsg();

class wechatCallbackapiTest
{
	public function valid()
    {
        $echoStr = $_GET["echostr"];

        //valid signature , option
        if($this->checkSignature()){
        	echo $echoStr;
        	exit;
        }
    }

    public function responseMsg()
    {
		//get post data, May be due to the different environments
		$postStr = $GLOBALS["HTTP_RAW_POST_DATA"];

      	//extract post data
		if (!empty($postStr)){
                /* libxml_disable_entity_loader is to prevent XML eXternal Entity Injection,
                   the best way is to check the validity of xml by yourself */
                libxml_disable_entity_loader(true);
              	$postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
                $fromUsername = $postObj->FromUserName;
                $toUsername = $postObj->ToUserName;
                $keyword = trim($postObj->Content);
                $time = time();
                $textTpl = "<xml>
							<ToUserName><![CDATA[%s]]></ToUserName>
							<FromUserName><![CDATA[%s]]></FromUserName>
							<CreateTime>%s</CreateTime>
							<MsgType><![CDATA[%s]]></MsgType>
							<Content><![CDATA[%s]]></Content>
							<FuncFlag>0</FuncFlag>
							</xml>";     

				 $ev = $postObj->Event;
				 if($ev == "subscribe")
				 {
					$msgType = "<xml>
								<ToUserName><![CDATA[toUser]]></ToUserName>
								<FromUserName><![CDATA[fromUser]]></FromUserName>
								<CreateTime>12345678</CreateTime>
								<MsgType><![CDATA[news]]></MsgType>
								<ArticleCount>2</ArticleCount>
								<Articles>
								<item>
								<Title><![CDATA[欢迎关注]]></Title> 
								<Description><![CDATA[description1]]></Description>
								<PicUrl><![CDATA[http://hellopytz.duapp.com/image/1.jpg]]></PicUrl>
								<Url><![CDATA[http://www.baidu.com]]></Url>
								</item>
								<item>
								<Title><![CDATA[这里是微信课堂]]></Title>
								<Description><![CDATA[description]]></Description>
								<PicUrl><![CDATA[http://hellopytz.duapp.com/image/2.jpg]]></PicUrl>
								<Url><![CDATA[http://www.qq.com]]></Url>
								</item>
								</Articles>
								</xml>";
					 $resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time);
                	 echo $resultStr;
				 }
				 
				if(!empty( $keyword ))
                {
					
					switch($keyword)
					{
						case "1":
							$contentStr = "公司简介";
							break;
						case "2":
							$contentStr = "最新优惠";
							break;
						default:
							$contentStr = "Welcome to PYTZ World!";
					}
                	$resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time, $msgType, $contentStr);
                	echo $resultStr;
                }else{
                	echo "Input something...";
                }

        }else {
        	echo "";
        	exit;
        }
    }
		
	private function checkSignature()
	{
        // you must define TOKEN by yourself
        if (!defined("TOKEN")) {
            throw new Exception('TOKEN is not defined!');
        }
        
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];
		$token = TOKEN;
		$tmpArr = array($token, $timestamp, $nonce);
        // use SORT_STRING rule
		sort($tmpArr, SORT_STRING);
		$tmpStr = implode( $tmpArr );
		$tmpStr = sha1( $tmpStr );
		
		if( $tmpStr == $signature ){
			return true;
		}else{
			return false;
		}

		
	}
}

?>