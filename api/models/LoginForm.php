<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2017/3/23
 * Time: 20:13
 */

namespace api\models;


use common\models\User;
use yii\base\Model;

class LoginForm extends Model
{
    public $username;
    public $password;

    private $_user;

    const GET_ACCESS_TOKEN = 'generate_access_token';

    public function init()
    {
        parent::init();
        $this->on(self::GET_ACCESS_TOKEN, [$this, 'onGenerateAccessToken']);
    }

    public function rules()
    {
        return [
            [['username', 'password'], 'required'],
            ['password', 'validatePassword'],
        ];
    }

    public function validatePassword($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $this->_user = $this->getUser();
            if (!$this->_user || !$this->_user->validatePassword($this->password)) {
                $this->addError($attribute, '用户密码错误!');
            }
        }
    }

    protected function getUser()
    {
        if ($this->_user === null) {
            $this->_user = User::findByUsername($this->username);
        }

        return $this->_user;
    }

    public function attributeLabels()
    {
        return [
            'username' => '用户名',
            'password' => '密码',
        ];
    }

    public function login()
    {
        if($this->validate()){
            $this->trigger(self::GET_ACCESS_TOKEN);
            return $this->_user;
        }else{
            return null;
        }
    }

    /**
     * 登录校验成功后，为用户生成新的token
     * 如果token失效，则重新生成token
     */
    public function onGenerateApiToken ()
    {
        if (!User::AccessTokenIsValid($this->_user->access_token)) {
            $this->_user->generateApiToken();
            $this->_user->save(false);
        }
    }


}