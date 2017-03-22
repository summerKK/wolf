<?php
/**
 * Created by PhpStorm.
 * User: summer
 * Date: 2017/3/23
 * Time: 0:04
 */

namespace backend\components\event;


use Yii;

class Mail
{
    public static function sendMail($obj)
    {
        $mail = Yii::$app->mailer->compose();
        $mail->setTo($obj->email);
        $mail->setSubject($obj->subject);
        $mail->setTextBody($obj->content);

        return $mail->send();
    }
}