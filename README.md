# AndyExtension
A fast, convenient and nonintrusive conversion for JSON to model. Your model class don't need to extend another base class. You don't need to modify any model file.

_AnyExtionsion aimed to Combine JSON to Model easily._

__*There are two main Class methods:*__

- `+ (instancetype)andy_objectWithKeyValues:(NSDictionary *)keyValues;`

    The argument is a dictionary. Just use Model Class call this method, you can get one model contains data as you define.

- `+ (NSArray *)andy_objectArrayWithKeyValuesArray:(NSArray *)keyValuesArray;
`

    The argument is an array. JJust use Model Class call this method, you can get an arrary contains array data as you define.

__*Another two Class methods for Model implementation:*__

- `+ (NSDictionary *)andy_replacedKeyFromPropertyName;`

    Use this method, you can replace the key in JSON to what you want to use in your Model.

    For instance, the `id` key in JSON, you can replace it to Model key `ID`.

+ `+ (NSDictionary *)andy_objectClassInArray`

    Use this method, you can replace the array type in JSON to an array according your Model that is containted in array.

_**Tips:**_

- Two cautions in AndyExtesion, please ignore.That‘s what I imply to use. I’ll fix them in the coming versions.

- Before you run, you need pod install first.(Since I use RAC and Masonry to reduce my codes.)







_The version is 1.0_

_There are a lot of experience to improve_

_If you are also interst on it, just pull request_
