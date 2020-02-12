//
//  TMDBMovieCollectionViewCell.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 10/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "TMDBMovieCollectionViewCell.h"
#import <SDWebImage/SDWebImage.h>
#import "APIHelper.h"
#import "UserData.h"

@interface TMDBMovieCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *favouriteButton;

@end


@implementation TMDBMovieCollectionViewCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupCell];
    }
    return self;
}

- (void)setupCell {
    self.contentView.layer.cornerRadius = 10;
}

+ (NSString *)identifier {
    return @"TMDBMovieCollectionViewCell";
}

- (void)setupWithSourceable:(id<CollectionSourceable>)sourceable {
    self.tag = sourceable.movieId;
    [self.imageView sd_setImageWithURL:[APIHelper urlForImagePath:sourceable.sourceableImagePath] placeholderImage:[UIImage imageNamed:@"moviePlaceholder"]];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.titleLabel.text = sourceable.sourceableTitle;
        self.subtitleLabel.text = sourceable.sourceableSubtitle;
    });
    
    [self refreshFavourite];
}

- (void)prepareForReuse {
    [self.imageView sd_cancelCurrentImageLoad];
    self.imageView.image = [UIImage imageNamed:@"moviePlaceholder"];//TODO: to const
    self.subtitleLabel.text = @"";
    self.titleLabel.text = @"";
}

- (IBAction)favouriteButtonClicked:(UIButton *)sender {
    self.favouriteButton.selected = !self.favouriteButton.isSelected;
    [[UserData shared] changeMovie:self.tag];
}

- (void)refreshFavourite {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.favouriteButton.selected = [[UserData shared] isFavourite:self.tag];
    });
}
@end
