<?php namespace Cadon\Stunring\Models;

use Model;

/**
 * Model
 */
class Product extends Model
{
    use \October\Rain\Database\Traits\Validation;
    use \October\Rain\Database\Traits\SoftDelete;
    use \October\Rain\Database\Traits\DeferredBinding;

    /**
     * @var array dates to cast from the database.
     */
    protected $dates = ['deleted_at'];

    /**
     * @var string table in the database used by the model.
     */
    public $table = 'cadon_stunring_products';

    public $casts = [
        'product_images' => 'array'
    ];

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

    public $hasOne = [
        'extension' => ['Cadon\Stunring\Models\ProductExtension', 'key' => 'product_id']
    ];

    public $hasMany = [
        'product_attributes' => ['Cadon\Stunring\Models\ProductAttribute', 'key' => 'product_id'],
        'reviews' => 'Cadon\Stunring\Models\Review'
    ];
    
    public $attachMany = [
        'images' => 'System\Models\File'
    ];

    public $belongsToMany = [
        'categories' => [
            'Cadon\Stunring\Models\Category',
            'table' => 'cadon_stunring_product_categories',
            'key' => 'product_id',
            'otherKey' => 'category_id'
        ]
    ];

    public function setReviewImagesAttribute($value)
    {
        $this->attributes['product_images'] = json_encode($value);
    }
    
    public function getImageUrlAttribute()
    {
        return count($this->product_images ?? []) ? $this->product_images[0] : null;
    }

    public function getCategoryNameAttribute()
    {
        $firstCategory = $this->categories->first();

        if ($firstCategory) {
            return $firstCategory->category_name;
        }

        return null;
    }
}
