<?php
namespace common\models;

use yii\base\Model;

/**
 * Signup form
 */
class SignupForm extends Model
{
    public $username;
    public $email;
    public $password;

    public $create_at;
    public $update_at;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'trim'],
            ['username', 'required','message'=>'用户名不能为空'],
            ['username', 'unique', 'targetClass' => '\backend\models\UserBackend', 'message' => '用户已经被注册'],
            ['username', 'string', 'min' => 2, 'max' => 255],

            ['email', 'trim'],
            ['email', 'required','message'=>'密码不能为空'],
            ['email', 'email'],
            ['email', 'string', 'max' => 255],
            ['email', 'unique', 'targetClass' => '\backend\models\UserBackend', 'message' => 'email已经被注册'],

            ['password', 'required','message'=>'密码不能为空'],
            ['password', 'string', 'min' => 6,'max'=>16,'tooShort'=>'密码至少要大于6位','tooLong'=>'密码长度不能超过16位'],

            [['create_at','update_at'],'default','value'=>date('Y-m-d H:i:s')]
        ];
    }

    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function signup()
    {
        if (!$this->validate()) {
            return null;
        }
        
        $user = new User();
        $user->username = $this->username;
        $user->email = $this->email;
        $user->setPassword($this->password);
        $user->generateAuthKey();
        
        return $user->save(false) ? $user : null;
    }
}
