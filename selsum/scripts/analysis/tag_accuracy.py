import numpy as np
import os
from argparse import ArgumentParser

def main(args):
    # breakpoint()
    tags_1 = []
    with open(args.file_path_1, 'r') as f:
        for l in f:
            _tags = [int(t) for t in l.strip().split()]
            tags_1.append(_tags)

    tags_2 = []
    with open(args.file_path_2, 'r') as f:
        for l in f:
            _tags = [int(t) for t in l.strip().split()]
            tags_2.append(_tags)

    product_overlaps = []
    for _tags_1, _tags_2 in zip(tags_1, tags_2):
        _tags_arr_1 = np.array(_tags_1)
        _tags_arr_2 = np.array(_tags_2)
        assert _tags_arr_1.sum() == _tags_arr_2.sum()
        assert _tags_arr_1.shape == _tags_arr_2.shape
        _ov = 1.0 * (_tags_arr_1 * _tags_arr_2).sum() / _tags_arr_1.sum()
        product_overlaps.append(_ov)

    overlap = sum(product_overlaps) / len(product_overlaps)

    print(f'Tag overlap: {overlap:.4f}')

if __name__ == "__main__":
    parser = ArgumentParser()

    parser.add_argument('-f1', '--file_path_1', type=str, required=True)
    parser.add_argument('-f2', '--file_path_2', type=str, required=True)

    args = parser.parse_args()

    main(args)
