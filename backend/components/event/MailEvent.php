<?php
/**
 * Created by PhpStorm.
 * User: summer
 * Date: 2017/3/23
 * Time: 0:19
 */

namespace backend\components\event;


use yii\base\Event;

class MailEvent extends Event
{
    public $email;

    public $subject;

    public $content;
}