<?php
/**
 * Created by PhpStorm.
 * User: summer
 * Date: 2017/3/23
 * Time: 0:06
 */

namespace backend\controllers;


use backend\components\event\MailEvent;
use yii\web\Controller;

class SendMailController extends Controller
{
    const SEND_MAIL = 'send_mail';

    public function init()
    {
        parent::init();
        $this->on(self::SEND_MAIL, ['backend\components\event\Mail', 'sendMail'],'hello world');
    }

    public function actionSend()
    {
        $mail = new MailEvent();
        $mail->email = '943515688@qq.com';
        $mail->subject = '测试事件';
        $mail->content = 'hello world!';
        $this->trigger(self::SEND_MAIL,$mail);
    }

}