<?php

namespace backend\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "blog_category".
 *
 * @property integer $blog_id
 * @property integer $category_id
 */
class BlogCategory extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'blog_category';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['blog_id', 'category_id'], 'required'],
            [['blog_id', 'category_id'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'blog_id'     => 'Blog ID',
            'category_id' => 'Category ID',
        ];
    }

    public static function getRelationCategorys($blogID)
    {
        $res = static::find()->select('category_id')->where(['blog_id'=>$blogID])->all();
        return $res ? ArrayHelper::getColumn($res, 'category_id') : [];
    }
}
