//
//  MovieDetailViewController.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 11/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "MovieDetailViewController.h"
#import <SDWebImage/SDWebImage.h>
#import "APIHelper.h"
#import "UserData.h"

@interface MovieDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLlabel;
@property (weak, nonatomic) IBOutlet UIButton *voteButton;
@property (weak, nonatomic) IBOutlet UIButton *favouriteButton;
@property (weak, nonatomic) IBOutlet UITextView *overviewTextView;

@end

@implementation MovieDetailViewController

#pragma mark - View's lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.source.sourceableTitle;
    [self fillOutlets];
    
     [self.navigationController setNavigationBarHidden:NO animated:YES];
}


#pragma mark - Methods
- (void)fillOutlets {
    if ([self.source respondsToSelector:@selector(sourceableImagePath)]) {
        [self.imageView sd_setImageWithURL:[APIHelper urlForImagePath:self.source.detailImagePath] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    }
    
    self.titleLlabel.text = self.source.sourceableTitle;
    
    [self.voteButton setTitle:[NSString stringWithFormat:@"%@: %@/%@", @"Rating", self.source.rating, @10.0]//TODO: to const - max rating, localizable string
                     forState:UIControlStateNormal];
    
    self.overviewTextView.text = self.source.sourceableSubtitle;
    NSInteger iden = self.source.movieId;
    [self.favouriteButton setSelected:[[UserData shared] isFavourite:iden]];
}

#pragma mark - Actions
- (IBAction)favouriteButtonSelected:(UIButton *)sender {
    sender.selected = !sender.selected;
    [[UserData shared] changeMovie:self.source.movieId];
}

@end
