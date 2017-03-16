<?php

namespace backend\models;

use common\models\Blog as CBlog;
use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "blog".
 *
 * @property integer $id
 * @property string $title
 * @property string $content
 * @property integer $create_time
 * @property integer $update_time
 */
class Blog extends CBlog
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'blog';
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::className(),
                'attributes' => array(
                    ActiveRecord::EVENT_BEFORE_INSERT => array('create_time', 'update_time'),
                    ActiveRecord::EVENT_BEFORE_UPDATE => array('update_time'),
                ),
            ]

        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['content'], 'string'],
            [['title'], 'string', 'max' => 100],
            ['title', 'required', 'message' => '请输入标题']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id'          => 'ID',
            'title'       => '标题',
            'content'     => '内容',
            'create_time' => '修改时间',
            'update_time' => '更新时间',
        ];
    }
}
