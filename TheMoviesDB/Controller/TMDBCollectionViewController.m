//
//  ViewController.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 08/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "TMDBCollectionViewController.h"
#import "APIManager.h"
#import "TMDBNowPlayingCollectionViewDataSource.h"
#import "MovieDetailViewController.h"
#import "TMDBMovieCollectionViewCell.h"

@interface TMDBCollectionViewController ()

@property (nonatomic, strong) TMDBNowPlayingCollectionViewDataSource *dataSource;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) NSIndexPath *indexPathToRefresh;
@property (nonatomic, assign) NSInteger lastLoadedPage;

@end

@implementation TMDBCollectionViewController

#pragma mark - View's lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //TODO: Add empty view
    //TODO: check the Internet connection
    //TODO: Add pull to refresh
    [self setupCollectionView];
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.indexPathToRefresh) {
        TMDBMovieCollectionViewCell *cell = (TMDBMovieCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:self.indexPathToRefresh];
        [cell refreshFavourite];
//        [self.collectionView reloadItemsAtIndexPaths:@[self.indexPathToRefresh]];
    }
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark - Data
- (void)loadData {

    [self startActivityIndicator];
    
    __weak TMDBCollectionViewController *weakSelf = self;
    [[APIManager shared] getConfigurationWithCompletion:^(BOOL loaded) {
        if (loaded) {
            [weakSelf loadDataForPage:@1];
        } else {
            //TODO: show error
            [weakSelf stopActivityIndicator];
        }
    }];
}

- (void)setupCollectionView {
    self.dataSource = [[TMDBNowPlayingCollectionViewDataSource alloc] init];
    self.collectionView.dataSource = self.dataSource;
    self.collectionView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);//to const
}

- (void)loadDataForPage:(NSNumber *)page {
    
    [self startActivityIndicator];
    
    __weak TMDBCollectionViewController *weakSelf = self;
    
    [[APIManager shared] getNowPlayingForPage:page
                                   completion:^(TMDBNowPlayingResponse * _Nonnull response) {
        [weakSelf stopActivityIndicator];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.dataSource appendResponse:response];
            weakSelf.lastLoadedPage = page.integerValue;
            NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:weakSelf.lastLoadedPage - 1];
            if (weakSelf.lastLoadedPage > 1) {
                [weakSelf.collectionView reloadSections:set];
            } else {
                [weakSelf.collectionView reloadData];
            }
            
        });
    } errorBlock:^(APIEntryError * _Nonnull error) {
        [weakSelf stopActivityIndicator];
        //TODO: handle error
    }];
}

#pragma mark - ActivityIndicator

- (void)stopActivityIndicator {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.activityIndicator.isAnimating) {
            [self.activityIndicator stopAnimating];
        }
    });
}

- (void)startActivityIndicator {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!self.activityIndicator.isAnimating) {
            [self.activityIndicator startAnimating];
        }
    });
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray<TMDBMovie *> *movies = [self.dataSource moviesForSection:indexPath.section];
    TMDBMovie *movie = movies[indexPath.row];
    MovieDetailViewController *vc =  [self.storyboard instantiateViewControllerWithIdentifier:@"MovieDetailViewController"];
    vc.source = (id<DetailSourceable, CollectionSourceable>)movie;
    
    self.indexPathToRefresh = indexPath;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger itemsForPage = 20;
    
    if (indexPath.row == itemsForPage - 1 && indexPath.section == self.lastLoadedPage - 1) {
         [self loadDataForPage:[NSNumber numberWithInteger:self.lastLoadedPage + 1]];
    }
}

#pragma  mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    UIEdgeInsets insets = collectionView.contentInset;
    //TODO: horizotnal less wide
    return CGSizeMake(CGRectGetWidth(collectionView.frame) - insets.left - insets.right, 250);//to const
}



@end
