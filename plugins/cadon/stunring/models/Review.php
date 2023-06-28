<?php

namespace Cadon\Stunring\Models;

use Model;

/**
 * Model
 */
class Review extends Model
{
    use \October\Rain\Database\Traits\Validation;
    use \October\Rain\Database\Traits\SoftDelete;

    public $casts = [
        'review_images' => 'array'
    ];
    
    /**
     * @var array dates to cast from the database.
     */
    protected $dates = ['deleted_at'];

    /**
     * @var string table in the database used by the model.
     */
    public $table = 'cadon_stunring_reviews';

    /**
     * @var array rules for validation.
     */
    public $rules = [];

    public $belongsTo = [
        'product' => 'Cadon\Stunring\Models\Product'
    ];

    public $attachMany = [
        'images' => 'System\Models\File'
    ];

    public function setReviewImagesAttribute($value)
    {
        $this->attributes['review_images'] = json_encode($value);
    }
    
    public function getImageUrlAttribute()
    {
        return count($this->review_images ?? []) ? $this->review_images[0] : null;
    }
    
}
