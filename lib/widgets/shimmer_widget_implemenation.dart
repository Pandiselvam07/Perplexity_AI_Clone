import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ShimmerWidget extends StatefulWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const ShimmerWidget({
    Key? key,
    required this.width,
    required this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: -2.0, end: 2.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, 0.5, 1.0],
              colors: [
                AppColors.cardColor,
                AppColors.searchBarBorder,
                AppColors.cardColor,
              ],
              transform: GradientRotation(_animation.value),
            ),
          ),
        );
      },
    );
  }
}

class SourceShimmer extends StatelessWidget {
  const SourceShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sources header shimmer
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.searchBarBorder,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title shimmer
                      ShimmerWidget(
                        width: double.infinity,
                        height: 16,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 8),
                      ShimmerWidget(
                        width: 120,
                        height: 16,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 10),

                      // URL shimmer
                      ShimmerWidget(
                        width: 160,
                        height: 12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const Spacer(),

                      // Bottom shimmer
                      Row(
                        children: [
                          ShimmerWidget(
                            width: 12,
                            height: 12,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          const SizedBox(width: 6),
                          ShimmerWidget(
                            width: 80,
                            height: 12,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AnswerShimmer extends StatelessWidget {
  const AnswerShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.submitButton.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const ShimmerWidget(
                  width: 24,
                  height: 24,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              const SizedBox(width: 10),
              const ShimmerWidget(width: 60, height: 20),
            ],
          ),
          const SizedBox(height: 20),

          // Answer content shimmer lines
          ...List.generate(6, (index) {
            // Vary the width of shimmer lines to look more natural
            double width = index == 5 ? 150 : double.infinity;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ShimmerWidget(
                width: width,
                height: 16,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),

          const SizedBox(height: 20),

          // Additional paragraph shimmer
          ...List.generate(4, (index) {
            double width = index == 3 ? 200 : double.infinity;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ShimmerWidget(
                width: width,
                height: 16,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class ChatResponseShimmer extends StatelessWidget {
  const ChatResponseShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SourceShimmer(),
        const SizedBox(height: 20),
        const AnswerShimmer(),
      ],
    );
  }
}
